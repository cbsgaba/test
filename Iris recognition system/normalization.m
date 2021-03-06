function [normalized_image,cropped_normalized_image] = normalization(iris_image,inner_center,inner_radii,outer_center,outer_radii)
%NORMALIZATION Summary of this function goes here
%   Detailed explanation goes here
figure('Name','Iris Normalization: Left eye','Position',[0 50 700 400]);
[sz1 sz2 sz3]=size(iris_image) %returns a row vector whose elements are the lengths of the corresponding dimensions of iris image. 
szx=sz2;
szy=sz1;

subplot(2,3,1),image(iris_image)
title('Center of iris and pupil boundary')
hold all;
Cx=floor(szx/2); Cy=floor(szy/2);
% plot(Cx,Cy,'co');

%------ outer ring

p = pi
x = 2*p*outer_radii;
length = floor(x)
center_x = floor((outer_center(1)+inner_center(1))*.5)
center_y = floor((outer_center(2)+inner_center(2))*.5)
 
plot(center_x,center_y,'r*');                                                        % check avg centre circle is not aligned to figure centre
% plot([center_x 1],[center_y 1],'r-.');
%-------- 
subplot(2,3,2), image(iris_image)
hold all;
plot(center_x,center_y,'r*');                                                        % check avg centre circle is not aligned to figure centre
title('Iris and Pupil boundary')
theta=[45:360/length:404+1-360/length];                                     % if step=1 then we only get 360 points but need an amount of L points
                                                                            % if angle step 1/L over minute waiting for for loop to finish
outer_radius=outer_radii+5;
outer_perimeter_x=outer_radius*sind(theta)+center_x;
outer_perimeter_y=outer_radius*cosd(theta)+center_y;                  % build outer perimeter
hL1=plot(outer_perimeter_x,outer_perimeter_y,'m'); % axis equal;grid on;  
hold all;
plot(hL1.XData,hL1.YData,'ro');


% #################################################inner ring                                                    
inner_radius=inner_radii+5;
perimeter_x=inner_radius*sind(theta)+center_x;
perimeter_y=inner_radius*cosd(theta)+center_y;                  % build outer perimeter
hL2=plot(perimeter_x,perimeter_y,'m'); % axis equal;grid on;  
hold all;
plot(hL2.XData,hL2.YData,'ro');

outer_x_ref=hL1.XData;
outer_y_ref=hL1.YData;
inner_x_ref=hL2.XData;
inner_y_ref=hL2.YData;

hold all;

outer_Sx={};
outer_Sy={};
hold all;
%###########################################################################
subplot(2,3,3), image(iris_image)
hold all;
plot(center_x,center_y,'r*');                                                        % check avg centre circle is not aligned to figure centre
title('Sweeping of Pupil')

hL1=plot(outer_perimeter_x,outer_perimeter_y,'m'); % axis equal;grid on;  
hold all;
plot(hL1.XData,hL1.YData,'ro');

hL2=plot(perimeter_x,perimeter_y,'m'); % axis equal;grid on;  
hold all;
plot(hL2.XData,hL2.YData,'ro');

for k=1:1:numel(hL1.XData)
    outer_Lx=floor(linspace(outer_x_ref(k),inner_x_ref(k),ceil(outer_radius)))
    outer_Ly=floor(linspace(outer_y_ref(k),inner_y_ref(k),ceil(outer_radius))) 
    plot(outer_Lx,outer_Ly,'go');    % check 
    plot([perimeter_x(k) outer_perimeter_x(k)],[perimeter_y(k) outer_perimeter_y(k)],'r');
    outer_Sx=[outer_Sx outer_Lx'];
    outer_Sy=[outer_Sy outer_Ly'];
end

sy=cell2mat(outer_Sx)
sx=cell2mat(outer_Sy)

plot(sy,sx,'b')

[s1 s2] = size(sx)

B=uint8(zeros(s1,s2));
for n=1:1:s2
    for k=1:1:s1
        B(k,n)=iris_image(sx(k,n),sy(k,n)); 
    end
end

normalized_image = B
subplot(2,3,4),imshow(normalized_image)
title('Normalized Iris Image')
hold all;

cropped_normalized_image = imcrop(normalized_image, [403.5 67.5 422 70])
subplot(2,3,5),imshow(cropped_normalized_image)
title('Cropped Normalized Image')
hold all;


end

    