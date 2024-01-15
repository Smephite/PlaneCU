
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
import matplotlib.animation as animation
from PIL import Image, ImageTk
import pandas as pd
import random
import cv2
from matplotlib import gridspec
import swd
import itertools

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
def setup_serial():
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
def readback_image(maxim):
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
    return result
def get_classes(maxim):
    return ['plane', 'ship', 'none'] if maxim else ['none', 'plane', 'ship']
def get_prediction(maxim, patch):
    ser.write(patch.tobytes())

    back = readback_image(maxim)

    pred = ser.read(3)
    pred = np.frombuffer(pred, dtype=np.uint8)
    print(pred)

    if not maxim:
        # STM will also return the time run
        s = ser.read(4)
        cycles = np.frombuffer(s, dtype=np.uint32)[0]
    else:
        cycles = None
    
    prediction = get_classes(maxim)[(np.argmax(pred))]

    return (prediction, back, cycles)

class App:
    def __init__(self, root, width, height, scene_path, step_size, patch_size = 20):
        self.root = root
        self.root.title("Sliding Window Demo")

        if width > height:
            width = height
        else:
            height = width
    
        self.width = width
        self.height = height

        self.root.geometry(f"{width}x{height}")

        image = Image.open(scene_path)
        image = np.array(image)
        image = image[:, :, :3]  #remove alpha channel 
        self.scene = image
        # Get image dimensions
        self.scene_height, self.scene_width, c = image.shape


        factor = self.scene_height / self.scene_width
        
        self.scene_width_w = round(width * 0.8)
        self.scene_height_w = round(self.scene_width_w * factor)

        print(self.scene_width_w, self.scene_height_w)

        self.scene_scaling_width = self.scene_width / self.scene_width_w
        self.scene_scaling_height = self.scene_height / self.scene_height_w

        self.step_size = step_size
        self.patch_size = patch_size
        self.rectangles = []



        self.scene_canvas = tk.Canvas(root, width=self.scene_width_w, height=self.scene_height_w)
        self.scene_canvas.pack(side=tk.LEFT, padx=10, pady=10)

        d = min(width - self.scene_width_w, height)
        print(d)
        self.patch_width_w = self.patch_height_w = round(d * 0.7)


        self.patch_canvas = tk.Canvas(root, width=self.patch_width_w, height=self.patch_height_w)
        self.patch_canvas.pack(side=tk.LEFT)

        # Initial image array (black image)
        self.scene_array = np.zeros((self.scene_width, self.scene_height, 3), dtype=np.uint8)
        self.patch_array = np.zeros((self.patch_size, self.patch_size, 3), dtype=np.uint8)


        y_range = range(90, self.scene_height - self.step_size - 50, self.step_size)
        x_range = range(90, self.scene_width - self.step_size - 30, self.step_size)

        self.iter = itertools.product(y_range, x_range)

        # Display the initial image
        self.display_image()

        # Start a timer to update the image periodically
        self.update_image()


    def update_canvas(self):
        canvas = self.scene_array
        (y, x) = next(self.iter)

        patch = self.scene[y:y+self.patch_size, x:x+self.patch_size]
        if patch.shape[0] != 20: return


        patch_position = (y % self.scene_height, x % self.scene_width)
        (prediction, back, cycles) = get_prediction(maxim, patch)

        self.patch_array = back or patch

        if (patch_position[0] % 2 or patch_position[1] % 2 == 0):
            canvas[patch_position[0]:patch_position[0]+self.patch_size, patch_position[1]:patch_position[1]+self.patch_size] = patch

        if (prediction == "plane"):
            rec = ((patch_position[1], patch_position[0]), "plane")
            self.rectangles.append(rec)

        if (prediction == "ship"):
            rec = ((patch_position[1], patch_position[0]), "ship")
            self.rectangles.append(rec)
        
        print(f'Prediction (from MCU): {prediction}')


        self.scene_array = canvas
    
    def draw_markers(self):
        for rectangle in self.rectangles:
            (x1, y1), label = rectangle

            self.scene_canvas.create_rectangle(
                round(x1/self.scene_scaling_width),
                round(y1/self.scene_scaling_height),
                round((x1 + self.patch_size)/self.scene_scaling_width),
                round((y1 + self.patch_size)/self.scene_scaling_height),
                outline="green2" if label == "plane" else "red")


    def display_image(self):
        # Update Scene
        scene = Image.fromarray(self.scene_array)
        scene = scene.resize((self.scene_height_w, self.scene_width_w))
        tk_scene = ImageTk.PhotoImage(scene)

        # Update the canvas with the new image
        self.scene_canvas.create_image(0, 0, anchor=tk.NW, image=tk_scene)
        self.scene_canvas.image = tk_scene  # Keep a reference to avoid garbage collection

        # Update Patch
        patch = Image.fromarray(self.patch_array)
        patch = patch.resize((self.patch_height_w, self.patch_width_w))
        tk_patch = ImageTk.PhotoImage(patch)

        # Update the canvas with the new image
        self.patch_canvas.create_image(0, 0, anchor=tk.NW, image=tk_patch)
        self.patch_canvas.image = tk_patch  # Keep a reference to avoid garbage collection

    def update_image(self):
        try:
            # Update the image array (in this example, randomly changing pixels)
            self.update_canvas()

            # Display the updated image
            self.display_image()

            self.draw_markers()


            # Schedule the next update after 1000 milliseconds (1 second)
            self.root.after(10, self.update_image)
        except:
            pass

if __name__ == '__main__':


    (ser, maxim) = init_serial()
    setup_serial()            
           
    step_size = 7 if not maxim else 10
        
    root = tk.Tk()
    app = App(root, 900, 900, "./planeships.png", step_size)

    try:
        # Run the Tkinter event loop
        root.mainloop()
    except KeyboardInterrupt:
        # Handle CTRL+C by destroying the Tkinter root window
        root.destroy()
        exit()