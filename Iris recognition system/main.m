clc;
close all;
clear;
workspace;
%--------------------------------------------
%image = imageacquisition();
left_iris_image = imread('~/Documents/Github/git_workspace/test/MMU-Iris-Database/3/left/chingycl1.bmp' )
right_iris_image = imread('~/Documents/Github/git_workspace/test/MMU-Iris-Database/3/right/chingycr1.bmp'  )


figure('Name','Iris Segmentation: Right eye','Position',[0 1000 700 500])
right_resized_image = imresize(right_iris_image,2.5)
right_segmented_image = segmentation(right_resized_image)



figure('Name','Iris Segmentation: Left eye','Position',[800 1000 700 500])
left_resized_image = imresize(left_iris_image,2.5)
left_segmented_image = segmentation(left_resized_image)


