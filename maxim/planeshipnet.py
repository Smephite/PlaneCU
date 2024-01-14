###################################################################################################
# MemeNet network
# Marco Giordano
# Center for Project Based Learning
# 2023 - ETH Zurich
###################################################################################################
"""
PlaneShipNet network description
"""
from signal import pause
from torch import nn

import ai8x

import matplotlib
import matplotlib.pyplot as plt

"""
Network description class
"""
class PlaneShipNet(nn.Module):
    """
    7-Layer CNN - Lightweight image classification
    """
    def __init__(self, num_classes=3, dimensions=(20, 20), num_channels=3, bias=False, **kwargs):
        super().__init__()

        # assert dimensions[0] == dimensions[1]  # Only square supported

        # Keep track of image dimensions so one constructor works for all image sizes
        dim_x, dim_y = dimensions

        self.conv1 = ai8x.FusedConv2dReLU(in_channels = num_channels, out_channels = 24, kernel_size = 3,
                                          padding=1, bias=bias, **kwargs)
        # padding 1 -> no change in dimensions

        self.conv2 = ai8x.FusedMaxPoolConv2dReLU(in_channels = 24, out_channels = 32, kernel_size = 3,
                                          padding=1, bias=bias, **kwargs)
        dim_x //= 2  # pooling, padding 0
        dim_y //= 2
        # conv padding 1 -> no change in dimensions

        
        self.conv3 = ai8x.FusedMaxPoolConv2dReLU(in_channels = 32, out_channels = 40, kernel_size = 3,
                                          padding=1, bias=bias, **kwargs)


        #self.maxpool1 = ai8x.MaxPool2d(kernel_size=2, **kwargs)
        dim_x //= 2  
        dim_y //= 2
      

        #########################
        size = dim_x * dim_y * 40
        self.fcx = ai8x.Linear(size, 64, wide=False, bias=True, activation="relu", **kwargs)

        self.fcx2 = ai8x.Linear(64, num_classes, wide=True, bias=True, **kwargs)
        #########################

        for m in self.modules():
            if isinstance(m, nn.Conv2d):
                nn.init.kaiming_normal_(m.weight, mode='fan_out', nonlinearity='relu')

    """
    Assemble the model
    """
    def forward(self, x):  # pylint: disable=arguments-differ
        """Forward prop"""
        
        x = self.conv1(x)
        x = self.conv2(x)
        #x = self.maxpool1(x)
        x = self.conv3(x)
        #########################

        x = x.view(x.size(0), -1)

       
        x = self.fcx(x)
        x = self.fcx2(x)

        # Loss chosen, CrossEntropyLoss, takes softmax into account already func.log_softmax(x, dim=1))

        return x


def planeshipnet(pretrained=False, **kwargs):
    """
    Constructs a PlaneShipNet model.
    """
    assert not pretrained
    return PlaneShipNet(**kwargs)

"""
Network description
"""
models = [
    {
        'name': 'planeshipnet',
        'min_input': 1,
        'dim': 2,
    }
]

