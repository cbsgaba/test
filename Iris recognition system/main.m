clc;
close all;
clear;
workspace;
%--------------------------------------------
%image = imageacquisition();
iris_image = imread('~/Documents/Github/git_workspace/test/MMU-Iris-Database/1/left/aeval1.bmp')

segmented_image = segmentation(iris_image)

