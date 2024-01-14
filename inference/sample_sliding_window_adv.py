
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
import cv2
from matplotlib import gridspec
import swd

autoResetSTM = True
POST_IMAGE = False

def init_serial():
    ser = None
    isMaxim = True

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


if __name__ == '__main__':



    (ser, maxim) = init_serial()
    classes = ['plane', 'ship', 'none'] if maxim else ['none', 'plane', 'ship']
    # flush the serial port
    if not maxim:
        print("Setting up STM32")

        cnt = 0
        cnt_dot = 0
        while True:

            if cnt_dot == 3:
                cnt_dot = 0
                print("\nSending start signal")
                if POST_IMAGE:
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

    
    fig, axes = plt.subplots(1, 2, figsize=(15,15))
    gs = gridspec.GridSpec(1, 2, width_ratios=[2, 1]) 
    
    plt.show(block=False)


    image_path = "./planeships.png"  
    image = Image.open(image_path)

    image = np.array(image)
    image = image[:, :, :3]  #remove alpha channel 

    # Get image dimensions
    height, width, c = image.shape

    print(height, width, c)
    
    canvas = np.zeros((width, height, 3), dtype=np.uint8)

    # Define the step size for extracting patches
    step_size = 7

    patch_size = 20

    axes[0] = plt.subplot(gs[0])
    axes[1] = plt.subplot(gs[1])

    #axes[0].imshow(cv2.cvtColor(image, None))
    img_plot = axes[0].imshow(canvas, extent=[0, width, 0, height])


    axes[0].set_title("Satellite")
    axes[1].set_title("Patch")
    plt.show(block=False)
    
    plt.tight_layout()

    axes[0].axis('off')
    axes[1].axis('on')

    rectangles = []

    # Iterate through the canvas and fill it progressively with patches
    for y in range(90, height - step_size - 50, step_size):                             
        for x in range(90, width - step_size - 30, step_size):
            # Extract the patch
            patch = image[y:y+patch_size, x:x+patch_size]

            if patch.shape[0] != 20: continue

            # Calculate the position to place the patch on the canvas
            patch_position = (y % height, x % width)

            # time.sleep(1)
            ser.write(patch.tobytes())

            if (POST_IMAGE):
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
                    result = result.reshape((20, 20, 3))
                else:
                    # print(retImg.hex())
                    result = np.frombuffer(retImg, dtype=np.uint8)
                    
                    result = result.reshape((20, 20, 3))
            else:
                # No return pic, do a cross
                result = None

            pred = ser.read(3)
            pred = np.frombuffer(pred, dtype=np.uint8)
            print(pred)

            if not maxim:
                # STM will also return the time run
                s = ser.read(4)
                cycles = np.frombuffer(s, dtype=np.uint32)[0]
            
            if (patch_position[0] % 2 or patch_position[1] % 2 == 0):
                canvas[patch_position[0]:patch_position[0]+patch_size, patch_position[1]:patch_position[1]+patch_size] = patch

            if (classes[(np.argmax(pred))] == "plane"):
                
                rec = ((patch_position[1], patch_position[0]), (patch_position[1]+patch_size, patch_position[0]+patch_size), (0, 255, 0), 2)
                rectangles.append(rec)

            if (classes[(np.argmax(pred))] == "ship"):
                
                rec = ((patch_position[1], patch_position[0]), (patch_position[1]+patch_size, patch_position[0]+patch_size), (255, 0, 0), 2)
                rectangles.append(rec)


            print(f'Prediction (from MCU): {classes[(np.argmax(pred))]}')
            if result is None:
                axes[1].imshow(patch)
            else:
                axes[1].imshow(result)
            #Only print certain patches
            if (x % 40 == 0 or classes[(np.argmax(pred))] != "none"):

                plt.pause(0.000001)
                img_plot.set_array(canvas)

                #Draw rectangles
                for rec in rectangles:
                    cv2.rectangle(canvas, rec[0], rec[1], color=rec[2], thickness=rec[3])


    plt.pause(0.000001)
    img_plot.set_array(canvas)
    #Draw rectangles
    for rec in rectangles:
                    cv2.rectangle(canvas, rec[0], rec[1], color=rec[2], thickness=rec[3])

    plt.show(block=True)
             
           
        

