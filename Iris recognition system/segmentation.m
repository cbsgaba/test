function [segmented_image]= segmentation(iris_image)
%binarization (converting grey scale image into black and white)

%displays the converted image RGB to gray image
gray_image = rgb2gray(iris_image)
subplot(2,3,1), imshow(gray_image, [])
title('Gray image')

%displays the binarized image
binarized_image = imbinarize(gray_image,'adaptive','ForegroundPolarity','dark','Sensitivity',0.5)
subplot(2,3,2), imshow(binarized_image, [])
title('Binarized image')

%displays the canny edged image
canny_img = edge(binarized_image, 'canny')
subplot(2,3,3), imshow(canny_img,[])
title('Canny edge')

%plots the outer area and inner area of the pupil
[outer_center,outer_radii] = imfindcircles(canny_img, [50,150],'Sensitivity',0.96);
disp(outer_center)
disp(outer_radii)
outer_center_value = outer_center(:,:);
outer_radii_value = outer_radii(:);
subplot(2,3,4), imshow(canny_img, [])
viscircles(outer_center_value,outer_radii_value,'Edgecolor','b')
title('Outer circle')

%plots the inner area of the pupil
[inner_center,inner_radii] = imfindcircles(canny_img, [10,40],'Sensitivity',0.8)
disp(inner_center)
disp(inner_radii)
inner_center_value = inner_center(:,:);
inner_radii_value = inner_radii(:);
subplot(2,3,5), imshow(canny_img, [])
viscircles(inner_center_value,inner_radii_value,'Edgecolor','w')
title('Inner circle')

%plots both
subplot(2,3,6), imshow(iris_image, [])
viscircles(inner_center_value,inner_radii_value,'Edgecolor','w')
viscircles(outer_center_value,outer_radii_value,'Edgecolor','b')
title('Outer and inner radius of iris')

%---------------------------------------------- alternative
% binarized_image = imbinarize(iris_image,'adaptive','ForegroundPolarity','dark','Sensitivity',0.5)
% canny_img = edge3(binarized_image,"approxcanny",0.6)
% morph_image = bwmorph3(canny_img,'clean')
% subplot(2,2,1),image(iris_image)
% title('graysca;e iris image')
% subplot(2,2,2),image(binarized_image)
% title('binarized image')
% subplot(2,2,3),image(canny_img)
% title('canny edge')
%subplot(2,2,4),image(morph_image)
%title('morph image')
% [centers,radii] = imfindcircles(binarized_image,[20,150],'Sensitivity',0.8')
% disp(centers)
% disp(radii)
% center = centers(:,:)
% radii = radii(:)
% subplot(2,2,4), image(iris_image)
% % % viscircles(center,radii,'Edgecolor','b')

end

