#!/usr/bin/python2
import cv2
import sys
import os 

ext = sys.argv[1][-4:]
filename = sys.argv[1][:-4]
path = os.path.dirname(os.path.realpath(filename+ext)) + '/'
print path+filename+ext
img = cv2.imread(filename+ext)

cam = int(sys.argv[2])
if cam==1 or cam==3:
    img = img[83:910]
elif cam==2 or cam==4:
    img = img[96:1373]
elif cam==0:
    img = img[96:910]


# scale = 4
# img = cv2.resize(img,  (img.shape[1]/scale, img.shape[0]/scale))

cv2.imwrite(path+filename+'.jpg', img, [cv2.IMWRITE_JPEG_QUALITY, 90])
