import numpy as np
import matplotlib.pyplot as plt

# Read the file containing the image data
with open('c_img.h', 'r') as file:
    content = file.read()

# Extract the image data from the #define block
start_marker = content.find('{')
end_marker = content.find('}')
image_data = content[start_marker + 1:end_marker].strip().replace("\\", "").replace("\n", "").replace(" ", "")

# Split the image data into individual values
image_values = image_data.split(',')

# Convert the values to integers
image_values = [int(value.strip(), 16) for value in image_values]

image_values = np.array(image_values, dtype=np.uint32)
# Extract the three least significant bytes from each value
byte_mask = 0xFF  # Mask to extract a single byte
byte1 = (image_values & (byte_mask << 0)) >> 0
byte2 = (image_values & (byte_mask << 8)) >> 8
byte3 = (image_values & (byte_mask << 16)) >> 16



# Create a 2D array with the extracted bytes
result = (np.stack((byte1, byte2, byte3), axis=-1).astype(np.int8) + 128).astype(np.uint8)


result = result.reshape((64, 64, 3))

print(result)

plt.imshow(result, )
plt.axis('off')
plt.show()