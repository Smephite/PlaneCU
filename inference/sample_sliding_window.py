
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
import cv2
from matplotlib import gridspec



if __name__ == '__main__':

    classes = ['plane', 'ship', 'none'] 

    POST_IMAGE = False

    ser = serial.Serial(port='/dev/ttyACM0', baudrate=115200, timeout=3)
    # flush the serial port
    ser.flush()
    ser.flushInput()
    ser.flushOutput()

    
    fig, axes = plt.subplots(1, 2, figsize=(15,15))
    gs = gridspec.GridSpec(1, 2, width_ratios=[2, 1]) 
    
    plt.show(block=False)


    image_path = "/media/alessandro/Volume/Dokumente/ETH/ML/Plane_Image_Classification/planeships.png"  
    image = Image.open(image_path)

    image = np.array(image)
    image = image[:, :, :3]  #remove alpha channel 

    # Get image dimensions
    height, width, c = image.shape

    print(height, width, c)
    
    canvas = np.zeros((width, height, 3), dtype=np.uint8)

    # Define the step size for extracting patches
    step_size = 10

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

            ser.write(patch.tobytes())

            if (POST_IMAGE):
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
            
            if (patch_position[0] % 2 or patch_position[1] % 2 == 0):
                canvas[patch_position[0]:patch_position[0]+patch_size, patch_position[1]:patch_position[1]+patch_size] = patch

            if (classes[(np.argmax(pred))] == "plane"):
                
                rec = ((patch_position[1], patch_position[0]), (patch_position[1]+patch_size, patch_position[0]+patch_size), (0, 255, 0), 2)
                rectangles.append(rec)

            if (classes[(np.argmax(pred))] == "ship"):
                
                rec = ((patch_position[1], patch_position[0]), (patch_position[1]+patch_size, patch_position[0]+patch_size), (255, 0, 0), 2)
                rectangles.append(rec)


            print(f'Prediction (from MCU): {classes[(np.argmax(pred))]}')
        
            axes[1].imshow(patch)
            
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
             
           
        

