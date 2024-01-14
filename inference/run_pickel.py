# Copyright 2021 ETH Zurich and University of Bologna.
# Licensed under the Apache License, Version 2.0, see https://www.apache.org/licenses/LICENSE-2.0 for details.
# SPDX-License-Identifier: Apache-2.0
#
# Author: Viviane Potocnik <vivianep@iis.ee.ethz.ch> (ETH Zurich) 
# Gratefully modified by Kai Berszin

from pickletools import uint8
import matplotlib.pyplot as plt
import matplotlib
import numpy as np
import serial
import serial.tools.list_ports
import sys
import time
import tkinter as tk
import customtkinter as ctk
from matplotlib.figure import Figure
from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg
from PIL import Image, ImageTk
import pandas as pd
import random
import gc
import swd
import ctypes as ct
import argparse

noSerial = False
returnPic = False
gui = False
autoResetSTM = True
randomizeInput = True
alternateInput = True
interactive = False
randomSeed = None


# Private
maxim = False


CROSS_DIAG = np.zeros((20, 20))
np.fill_diagonal(CROSS_DIAG, 1)
np.fill_diagonal(np.fliplr(CROSS_DIAG), 1)

CLASSES = ['none', 'plane', 'ship']

def parse_args():
    parser = argparse.ArgumentParser(
                prog='PlaneNet MCU Inference',
                description='Send example data to an MCU running PlaneNet, currently MAXIM and STM32 are supported',
                epilog='')
    
# noSerial = False
# returnPic = False
# gui = False
# autoResetSTM = True
# randomizeInput = True
# alternateInput = True
    parser.add_argument('--dry-run', '-n',
                    action='store_true', help="Dry run without MCU")  # on/off flag
    parser.add_argument('--no-gui', '-q', 
                    action='store_true', help="Disable GUI (faster)")  # on/off flag
    parser.add_argument('--rst', '-b',
                    action='store_true', help="Automatically Reset MCU on start (only STM)")  # on/off flag
    parser.add_argument('--random', '-r',
                    action='store_true', help="Randomize input vector (TEST MODE)")  # on/off flag
    parser.add_argument('--alternate', '-a',
                    action='store_true', help="Augment input vector to alternate classes (TEST MODE)")  # on/off flag
    parser.add_argument('--image', '-i',
                    action='store_true', help="Request MCU to return send vector")  # on/off flag
    parser.add_argument('--interactive', '-x',
                    action='store_true', help="Only show minimal data on printout")  # on/off flag
    parser.add_argument('--presentation', '-p',
                    action='store_true', help="Presentation mode (Overwrites other stuff!!)")  # on/off flag
    parser.add_argument('--seed', '-s',
                    action='store', help="Random Seed", default=None)  # on/off flag
    args = parser.parse_args()
    
    global noSerial, returnPic, gui, autoResetSTM, randomizeInput, alternateInput, interactive, randomSeed

    noSerial = args.dry_run
    returnPic = args.image
    gui = not args.no_gui
    autoResetSTM = args.rst
    randomizeInput = args.random
    alternateInput = args.alternate
    interactive = args.interactive
    randomSeed = args.seed

    if args.presentation:
        print("Presentation mode!")
        noSerial = False
        gui = True
        returnPic = True
        autoResetSTM = True
        randomizeInput = True
        alternateInput = True
        interactive = False
        randomSeed = 527532365

def load_data():
    # Load from pickel
    x_test = np.load('x_test.npy',allow_pickle=True)
    y_test = np.load('y_test.npy',allow_pickle=True).squeeze()

    y_test = np.apply_along_axis(lambda x : np.where(x == 1)[0][0], axis=1, arr=y_test)

    data = list(zip(x_test, y_test))

    if randomizeInput:
        random.Random(randomSeed).shuffle(data)

    if not alternateInput:
        return data

    ships = []
    planes = []
    none = []

    for (d, l) in data:
        if l == 0:
            none.append((d, l))
        elif l == 1:
            planes.append((d,l))
        else:
            ships.append((d, l))
    
    d_f = []
    
    for i in range(min([len(planes), len(none), len(ships)])*3):
        
        n = i % 3
        data = none if n == 0 else planes if n == 1 else ships

        d = data[int(i/3)]

        d_f.append(d)
    
    return d_f

def init_serial():
    ser = None
    isMaxim = True

    if not noSerial:
        ports = serial.tools.list_ports.comports()

        for port, desc, hwid in sorted(ports):
                if not ("STM32 STLink" in desc or "CMSIS-DAP" in desc):
                    continue
                print(desc)
                isMaxim = not "STM32 STLink" in desc

                try:
                    ser = serial.Serial(port, 115200, timeout=30)
                    ser.flush()
                    ser.flushInput()
                    ser.flushOutput()
                    
                except serial.SerialException as e:
                    print("Could not open {}: {}".format(port, e))
                    ser = None
                
                if isMaxim:
                    print(f"Found Maxim at {port}")
                    break
                else:
                    print(f"Found STM32 at {port}")
                    break
    
        if ser == None:
            print("Did not find fitting MCU!")
        if not isMaxim and autoResetSTM:
            try:
                dev = swd.Swd()
                cm =swd.CortexM(dev)
                print("Resetting STM32...")
                cm.reset()
                time.sleep(0.5)
            except:
                print("Could not reset MCU")
                pass
            pass

    return (ser, isMaxim)

def init_plot():
    fig, axes = plt.subplots(1, 3)
    label = plt.figtext(0.4, 0.8, f"Starting...")  
    plt.show(block=False)

    axes[0].set_title("Returned")
    axes[0].axis('off')
    

    axes[1].set_title("Truth")
    axes[1].axis('off')

    axes[2].set_xticks(np.arange(len(CLASSES)))
    axes[2].set_yticks(np.arange(len(CLASSES)))
    axes[2].set_xticklabels(CLASSES)
    axes[2].set_yticklabels(CLASSES)

    conf_text = [[None, None, None],
        [None, None, None],
        [None, None, None]]
    for i in range(len(CLASSES)):
        for j in range(len(CLASSES)):
            conf_text[i][j] = axes[2].text(j, i, "0",
                        ha='center', va='center', color='black', fontsize=14)

    return (label, axes[0], axes[1], axes[2], conf_text)

def init_confusion_matrix():
    confusion = np.zeros((3, 3))

    return confusion

def pred_to_class(pred, maxim=False):
    return np.argmax(pred) if not maxim else ((np.argmax(pred)+ 1) %3)

def inference(ser: serial.Serial|None, input, maxim=False):
    image = None
    if ser != None:
        send = input.tobytes()
        
        if(len(send) != 20*20*3):
            print(f"Unexpected image length: {len(send)}")
            exit(-1)

        ser.write(send)
        # We do return pics
        if returnPic:
            # on the maxim the data is stored in uint32 with the pattern [0x00, 0xRR, 0xGG, 0xBB] where the pixels are int8
            retLen = 20*20*4 if maxim else 20*20*3

            retImg = ser.read(retLen)

            if maxim:
                image_values = np.frombuffer(retImg, dtype=np.uint32)

                # # Extract the three least significant bytes from each value
                byte_mask = 0xFF  # Mask to extract a single byte
                byte1 = (image_values & (byte_mask << 0)) >> 0
                byte2 = (image_values & (byte_mask << 8)) >> 8
                byte3 = (image_values & (byte_mask << 16)) >> 16



                # # Create a 2D array with the extracted bytes
                result = (np.stack((byte1, byte2, byte3), axis=-1).astype(np.int8) + 128).astype(np.uint8)
                image = result.reshape((20, 20, 3))
            else:
                # print(retImg.hex())
                result = np.frombuffer(retImg, dtype=np.uint8)
                
                image = result.reshape((20, 20, 3))
        else:
            # No return pic, do a cross
            image = None
        
        #endif returnPic
        pred = ser.read(3)
        
        if pred == b'':
            print("Error: Serial timed out!")
            return (None, None)

        pred = np.frombuffer(pred, dtype=np.uint8)
        
        if not interactive:
            print(pred)

        pred_idx = pred_to_class(pred, maxim)

        inf_time = np.nan
        if not maxim:
            # STM will also return the time run
            s = ser.read(4)
            cycles = np.frombuffer(s, dtype=np.uint32)[0]
            
            
            inf_time = cycles / 80000

        return (image, pred_idx, inf_time)
        
    else:
        return (None, None, np.nan)

def update_plots(plots, trueImage, retImage, confusion, trueLabel, mcuLabel, correctCount, totalCount, inf_time):

    (label, returnedFig, actualFig, confFig, confText) = plots
    actualFig.imshow(trueImage)

    if retImage is not None:
        returnedFig.imshow(retImage)
    else:
        returnedFig.imshow(CROSS_DIAG, cmap="gray")



    confFig.matshow(confusion, cmap=plt.get_cmap("Blues"))


    for i in range(len(CLASSES)):
        for j in range(len(CLASSES)):
            confText[i][j].set_text(str(int(confusion[i][j])))



    mcu = "MAXIM" if maxim else "STM32"

    prefix = "DEMO (no MCU)\nInference: NaN\n" if noSerial else f"LIVE ({mcu})\nInference: {round(inf_time, 2)}ms\n"

    label.set(text= f"{prefix}{mcuLabel} <> {trueLabel}\nAcc: {round(correctCount/totalCount, 2)}") 
    label.set_color('green' if true_label == mcu_label else 'red')
    
    plt.tight_layout()
    plt.pause(1/20)
    # plt.draw()


if __name__ == '__main__':

    parse_args()

    if randomSeed == None:
        randomSeed = random.randint(0, 999_999_999)
    
    print(f"Serial: {'NO' if noSerial else 'YES'}")
    print(f"retPic: {'NO' if not returnPic else 'YES'}")
    print(f"gui: {'NO' if not gui else 'YES'}")
    print(f"reset: {'NO' if not autoResetSTM else 'YES'}")
    print(f"randIn: {'NO' if not randomizeInput else 'YES'}")
    print(f"altIn: {'NO' if not alternateInput else 'YES'}")
    print(f"interactive: {'NO' if not interactive else 'YES'}")
    print(f"Random Seed: {randomSeed}")
    print("\n\n")


    data = load_data()

    # print(f'Loaded x with shape: {x_test.shape}')
    # print(f'Loaded y with shape: {y_test.shape}')

    (ser, maxim) = init_serial()

    noSerial = noSerial or ser == None

    if noSerial:
        print("Not using serial!")

    correct_count = 0
    num_pred = 0

    test_len = len(data)
    if gui:
        plots = init_plot()
    
    confusion = init_confusion_matrix()

    if not maxim:
        print("Setting up STM32")

        cnt = 0
        cnt_dot = 0
        while True:

            if cnt_dot == 3:
                cnt_dot = 0
                print("\nSending start signal")
                if returnPic:
                    ser.write(b'\x11')
                else:
                    ser.write(b'\x00') 
                  
            b = ser.read()
            # print(b)
            print(b.decode(), end="", flush=True)
            if b == b'\x00':
                break
            elif b == b'.':
                cnt = 0
                cnt_dot += 1
            else:
                cnt = 0
        print("")
        print("Starting program!")
    

    for (x,y) in data: 
        num_pred += 1

        
        (retImage, pred_idx, inf_time) = inference(ser, x, maxim)

        if pred_idx is None:
            # only happens in test mode
            pred_idx = y


        true_label = CLASSES[y]
        mcu_label = CLASSES[pred_idx]

        
        if (true_label == mcu_label):
            correct_count += 1

        confusion[y][pred_idx] += 1
        
        print(f"n={num_pred}:")
        print(f"Truth: {true_label}, Prediction: {mcu_label} in {inf_time}ms (Acc: {round(correct_count/num_pred*100, 2)}%)")
        print(confusion)
                  
        if interactive:
            print("\r\r\r\r\r\r", end="")
            print("\x1b[1K")
            print("\r\r\r\r\r\r", end="")
            


        if gui:
            update_plots(plots, x, retImage, confusion, true_label, mcu_label, correct_count, num_pred, inf_time)

        gc.collect()
        # time.sleep(1)





    try:
        print("Press Ctrl+C to interrupt.")
        while True:
            time.sleep(1)  # Sleep for 1 second (adjust as needed)
    except KeyboardInterrupt:
        print("\nInterrupted by user. Exiting...")
        sys.exit(0)

