%image = imageacquisition();

iris_image = imread('~/Documents/Github/git_workspace/test/MMU-Iris-Database/1/left/aeval1.bmp')
[binarized_image,canny_edge,morph_image] = segmentation(iris_image)


subplot(2,2,1),image(iris_image)
title('iris image')
subplot(2,2,2),image(binarized_image)
title('binarized image')
subplot(2,2,3),image(canny_edge)
title('canny edge')
subplot(2,2,4),image(morph_image)
title('morph image')
