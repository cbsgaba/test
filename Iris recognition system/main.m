clc;
close all;
clear;
workspace;
%--------------------------------------------
%image = imageacquisition();
iris_image = imread('~/Documents/Github/git_workspace/test/MMU-Iris-Database/1/left/aeval1.bmp')
figure('Name','Iris Segmentation: Left eye','Position',[0 1000 700 400])
resized_image = imresize(iris_image,2.5)
%-- segmentation call function
[gray_image,inner_center,inner_radii,outer_center,outer_radii] = segmentation(resized_image)

% %-- iris image 2
% iris_image2 = imread('~/Documents/Github/git_workspace/test/MMU-Iris-Database/1/left/aeval5.bmp')
% figure('Name','is SegIris Segmentation: Left eye 2','Position',[0 1000 700 400])
% resized_image2 = imresize(iris_image2,2.5)
% %--segmentation call function
% [gray_image2,inner_center2,inner_radii2,outer_center2,outer_radii2] = segmentation(resized_image2)

%-- normalization call function
figure('Name','Iris Normalization: Left eye','Position',[0 50 700 400]);
[normalized_image] = normalization(resized_image,inner_center,inner_radii,outer_center,outer_radii)

% figure('Name','Iris Normalization: Left eye 2','Position',[0 150 700 400]);
% normalized_image2 = normalization(resized_image2,inner_center2,inner_radii2,outer_center2,outer_radii2)

%-- feature extraction call function
figure('Name','Iris Feature Extraction: Left eye','Position',[800 1000 700 400]);
[cropped_normalized_image,image_scale] = feature_extraction(normalized_image)

% feature_extraction(normalized_image2)
%--------
% use d=imdistline to approximate circles (a draggable line)

