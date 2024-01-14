###################################################################################################
# 2023 - ETH Zurich - Alessandro Weber
###################################################################################################
"""
PlaneShipNet dataset
"""
from torch import Generator
from torch.utils.data import Dataset
from torch.utils.data import DataLoader

from torch.utils.data import random_split

from torchvision import transforms
from torchvision.io import read_image

import ai8x

import os
import pandas as pd
import numpy as np

import matplotlib.pyplot as plt

"""
Custom image dataset class
"""
class PlaneShipDataset(Dataset):
    def __init__(self, img_dir, transform=None):
        self.img_labels = pd.read_csv(os.path.join(img_dir, "labels.txt"))
        self.img_dir = img_dir
        self.transform = transform

    def __len__(self):
        return len(self.img_labels)

    def __getitem__(self, idx):
        img_path = os.path.join(self.img_dir, self.img_labels.iloc[idx, 0])
        image = read_image(img_path)

        # Concatenate labels from columns 2, 3, and 4 into a single string
        label_str = ",".join(map(str, self.img_labels.iloc[idx, 1:4]))
        # Split the concatenated string into a list
        label_list = label_str.split(',')
        label = np.argmax(label_list)
        #label = self.img_labels.iloc[idx, 1]
        if self.transform:
            image = self.transform(image)
        return image, label



"""
Dataloader function
"""
def planeship_get_dataset(data, load_train=False, load_test=False):
   
    (data_dir, args) = data

    

    
    if load_train:
        train_transform = transforms.Compose([
            transforms.ToPILImage(mode="RGB"),
            transforms.RandomHorizontalFlip(),
            transforms.RandomVerticalFlip(),
            transforms.RandomRotation(360),
            transforms.RandomResizedCrop((20,20), scale=(0.8, 1.0)),
            transforms.Resize((20,20)),
            transforms.ToTensor(),
            ai8x.normalize(args=args)
        ])
        
        train_dataset = PlaneShipDataset(img_dir=os.path.join(data_dir, "planeships", "train"), transform=train_transform)
    else:
        train_dataset = None
   
    if load_test:
        test_transform = transforms.Compose([
            transforms.ToPILImage(mode="RGB"),
            transforms.RandomHorizontalFlip(),
            transforms.RandomVerticalFlip(),
            transforms.RandomRotation(360),
            transforms.RandomResizedCrop((20,20), scale=(0.8, 1.0)),
            transforms.Resize((20,20)),
            transforms.ToTensor(),
            #transforms.Normalize(mean=[0.485, 0.456, 0.406], std=[0.229, 0.224, 0.225])
            ai8x.normalize(args=args)
        ])
        test_dataset = PlaneShipDataset(img_dir=os.path.join(data_dir, "planeships", "test"), transform=test_transform)

    else:
        test_dataset = None

    return train_dataset, test_dataset


"""
Dataset description
"""
datasets = [
    {
        'name': 'planeships',
        'input': (3, 20, 20),
        'output': list(map(str, range(3))),
        'weight': (4.54, 37, 2),     
        'loader': planeship_get_dataset,
    }
]


#weights for classes: 36000 images, 8000 planes, 1000 ships, 27000 none -> (4.54, 37, 1.33)  (multipled none class for better results)


if __name__ == '__main__':
    

    args = {"act_mode_8bit": (True)}
    dataloader = DataLoader(planeship_get_dataset(("./data", args), load_train=False, load_test=True), batch_size=4,
                        shuffle=True, num_workers=0)
    
    

    fig, ax = plt.subplots(4, 4)

    for i_batch, sample_batched in enumerate(dataloader):
        print(i_batch, sample_batched[0].size(),
            sample_batched[1].size())

        print(sample_batched[1])

        # observe 4th batch and stop.
        if i_batch < 4:
            for i, img in enumerate(sample_batched[0]):
                print(img.shape)
                ax[i_batch, i].imshow(img.permute((1,2,0)))
                
    plt.title('Batch from dataloader')
    plt.axis('off')
    plt.ioff()
    plt.show()
