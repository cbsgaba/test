function [gray_image,inner_center,inner_radii,outer_center,outer_radii]= segmentation(iris_image)
%binarization (converting grey scale image into black and white)


% figure('Name','Iris Segmentation','Position',[50 1000 700 500])
%displays the converted image RGB to gray image
gray_image = rgb2gray(iris_image)
subplot(2,3,1), imshow(gray_image, [])
title('Gray image')

%displays the binarized image
binarized_image = imbinarize(gray_image,'adaptive','ForegroundPolarity','dark','Sensitivity',0.45)
subplot(2,3,2), imshow(binarized_image,[])
title('Binarized image')

%displays the canny edged image
canny_img = edge(binarized_image, 'canny')
subplot(2,3,3), imshow(canny_img, [])
title('Canny edge')

%plots the outer area and inner area of the pupil
% [outer_center,outer_radii] = imfindcircles(canny_img, [50,150],'Sensitivity',0.96)
[outer_center,outer_radii] = imfindcircles(canny_img, [100 300],'Sensitivity',0.96, 'ObjectPolarity','bright')
disp(outer_center)
disp(outer_radii)
outer_center_value = outer_center(:,:);
outer_radii_value = outer_radii(:);
subplot(2,3,4), imshow(canny_img, [])
viscircles(outer_center_value,outer_radii_value,'Edgecolor','b')
title('Outer circle')

%plots the inner area of the pupil
% [inner_center,inner_radii] = imfindcircles(canny_img, [10,40],'Sensitivity',0.8)
[inner_center,inner_radii] = imfindcircles(canny_img, [50 70],'Sensitivity',0.96,'ObjectPolarity','bright')
disp(inner_center)
disp(inner_radii)
inner_center_value = inner_center(:,:);
inner_radii_value = inner_radii(:);
subplot(2,3,5), imshow(canny_img, [])
viscircles(inner_center_value,inner_radii_value,'Edgecolor','w')
title('Inner circle')
hold all;
%plots both
subplot(2,3,6), imshow(iris_image, [])
viscircles(inner_center_value,inner_radii_value,'Edgecolor','w')
viscircles(outer_center_value,outer_radii_value,'Edgecolor','w')
title('Outer and inner radius of iris')
hold all;
if (outer_center_value ~= 0) & (outer_radii_value ~=0) & (inner_center_value ~= 0) & (inner_radii_value ~=0)
    segmented_image = 1
else
    segmented_image = 0

end

%
%
%
%problems encountered so far:
% high sensitivity = high error rate
%