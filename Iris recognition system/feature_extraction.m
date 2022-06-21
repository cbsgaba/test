function [outputArg1] = feature_extraction(normalized_image)
%FEATURE_EXTRACTION Summary of this function goes here
%   Detailed explanation goes here


figure('Name', 'Iris Recognition: Feature Extraction: histogram')
imhist(normalized_image)

title('morlet wavelet') 

end

