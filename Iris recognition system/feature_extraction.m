function [cropped_normalized_image,image_scale2] = feature_extraction(normalized_image)
%FEATURE_EXTRACTION Summary of this function goes here
%   Detailed explanation goes here

% 
% figure('Name', 'Iris Recognition: Feature Extraction: histogram')
% imhist(normalized_image)


cropped_normalized_image = imcrop(normalized_image, [403.5 67.5 422 70])

subplot(2,2,1),imshow(cropped_normalized_image)
title('Cropped Iris Image')
subplot(2,2,2),imhist(cropped_normalized_image)

figure('Name','Iris Feature Extraction: Morlet scales')
image_scale2 = cwtft2(cropped_normalized_image,'wavelet','morl','scales',1:10,'plot')
end

