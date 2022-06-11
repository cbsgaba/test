function [binarized_image,canny_edge,morph_image]= segmentation(iris_image)
%binarization (converting grey scale image into black and white)

binarized_image = imbinarize(iris_image,'adaptive','ForegroundPolarity','dark','Sensitivity',0.5)
canny_edge = edge3(binarized_image,"approxcanny",0.6)
morph_image= bwmorph3(canny_edge,'clean')
end

