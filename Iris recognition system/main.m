clc;
close all;
clear;
workspace;
%--------------------------------------------
%image = imageacquisition();
iris_image = imread('~/Documents/Github/git_workspace/test/MMU-Iris-Database/1/left/aeval1.bmp')
figure('Name','Iris Segmentation: Left eye','Position',[0 1000 700 500])
resized_image = imresize(iris_image,2.5)
[gray_image,inner_center,inner_radii,outer_center,outer_radii] = segmentation(resized_image)

% left2_iris_image = imread('~/Documents/Github/git_workspace/test/MMU-Iris-Database/7/left/chualsl4.bmp')
% figure('Name','Iris Segmentation: Right eye','Position',[0 1000 700 500])
% left2_resized_image = imresize(left2_iris_image,2.5)
% [left2_inner_center,left2_inner_radii,left2_outer_center,left2_outer_radii] = segmentation(left2_resized_image)

normalization(resized_image,inner_center,inner_radii,outer_center,outer_radii)
%--------
% use d=imdistline to approximate circles (a draggable line)

