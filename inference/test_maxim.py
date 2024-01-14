# Copyright 2021 ETH Zurich and University of Bologna.
# Licensed under the Apache License, Version 2.0, see https://www.apache.org/licenses/LICENSE-2.0 for details.
# SPDX-License-Identifier: Apache-2.0
#
# Author: Viviane Potocnik <vivianep@iis.ee.ethz.ch> (ETH Zurich) 

from pickletools import uint8
import matplotlib.pyplot as plt
import matplotlib
import numpy as np
import serial
import sys
import time
import tkinter as tk
import customtkinter as ctk
from matplotlib.figure import Figure
from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg
from PIL import Image, ImageTk
import pandas as pd
import random

if __name__ == '__main__':
    # matplotlib.use("Qt5Agg")

    x_test = np.load('x_test.npy',allow_pickle=True)
    y_test = np.load('y_test.npy',allow_pickle=True).squeeze()

   
    classes = ['plane', 'ship', 'none']


    def choose_random_image(csv_data):
        random_row = random.choice(csv_data)
        filename = random_row[0]
        labels = random_row[1:]
        return filename, labels

    def png_to_bytes(file_path):
        try:
            with open(file_path, 'rb') as file:
                image = Image.open(file)
                image = image.resize((20, 20))
                # Convert the image to a NumPy array and then to bytes
                image_array = np.array(image)
                #print(image_array)
                image_bytes = image_array.tobytes()
                return image_bytes
        except Exception as e:
            print(f"Error: {e}")
            return None

    csv_path = '/home/alessandro/Documents/ETH/MLMCU/ai8x-training/data/planeships/test/labels.txt'
    df = pd.read_csv(csv_path, sep=',')
    



    print(f'Loaded x with shape: {x_test.shape}')
    print(f'Loaded y with shape: {y_test.shape}')

    ser = serial.Serial(port='/dev/ttyACM0', baudrate=115200, timeout=3)
    # flush the serial port
    ser.flush()
    ser.flushInput()
    ser.flushOutput()
    ser.write(b'Hello World!')
    time.sleep(0.2)
   

    correct_count = 0
    # define how many images from the test set to send to the MCU
    test_len = len(x_test)
    # get how many prediction we iterated over
    num_pred = 0

    image_shape = x_test.shape[1:4]

    print(image_shape)
    
    fig, axes = plt.subplots(1, 2)
    plt.show(block=False)
    
    for index, row in df.iterrows(): 
        if index == 0: 
            continue
        num_pred += 1
        file = row['filename']
        labels = row[['plane', 'ship', 'none']].tolist()
        label = classes[np.argmax(labels)]

        
        ser.write(png_to_bytes("/home/alessandro/Documents/ETH/MLMCU/ai8x-training/data/planeships/test/" + file))

        ret = ser.read(400*4)

        image_values = np.frombuffer(ret, dtype=np.uint32)

        # Extract the three least significant bytes from each value
        byte_mask = 0xFF  # Mask to extract a single byte
        byte1 = (image_values & (byte_mask << 0)) >> 0
        byte2 = (image_values & (byte_mask << 8)) >> 8
        byte3 = (image_values & (byte_mask << 16)) >> 16



        # Create a 2D array with the extracted bytes
        result = (np.stack((byte1, byte2, byte3), axis=-1).astype(np.int8) + 128).astype(np.uint8)
        result = result.reshape((20, 20, 3))

        #time.sleep(0.5)


        pred = ser.read(3)
        pred = np.frombuffer(pred, dtype=np.uint8)
        print(pred)
        #pred = (np.argmax(pred) + 1) % 3
        
        print(f'Target: {label}, Prediction (from MCU): {classes[(np.argmax(pred))]}')
        if (classes[(np.argmax(pred))] == label):
            correct_count += 1

        print(correct_count/num_pred)

        
        axes[0].imshow(result)
        axes[0].set_title("Returned")
        axes[0].axis('off')

        with open("/home/alessandro/Documents/ETH/MLMCU/ai8x-training/data/planeships/test/" + file, 'rb') as file:
            image = Image.open(file)
            image = image.resize((20, 20))
            axes[1].imshow(image)
        axes[1].set_title("Truth")
        axes[1].axis('off')
        plt.tight_layout()
        plt.pause(0.01)
        plt.figtext(0.5, 0.95, f"{classes[(np.argmax(pred))]} vs {label} ")  
        plt.draw()
  

        


    # for x,y in zip(x_test[:test_len], y_test[:test_len]):
    #     num_pred += 1
    #     class_idx = y

    #     #x = np.array((x))
    #     #x = x - 128

    #     class_idx = np.where(y == 1)[0][0]

        

    #     ser.write(x.tobytes())
    #     # time.sleep(1)
    #         # img = ser.read(image_shape[0] * image_shape[1] * image_shape[2])
    #         # img = np.frombuffer(img, dtype=np.uint8)
            
    #         # print(f"Images was correctly send: {img.tobytes() == x.tobytes()}")
    #     # time.sleep(1)
    #     pred = ser.read(3)
    #     pred = np.frombuffer(pred, dtype=np.uint8)
    #     print(pred)
    #     #pred = (np.argmax(pred) + 1) % 3
        
    #     print(f'Target: {classes[class_idx]}, Prediction (from MCU): {classes[(np.argmax(pred))]}')
    #     if (np.argmax(pred)== class_idx):
    #         correct_count += 1

    #     print(correct_count/num_pred)