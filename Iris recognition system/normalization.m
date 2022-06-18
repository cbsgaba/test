function [normalized_image] = normalization(iris_image,inner_center,inner_radii,outer_center,outer_radii)
%NORMALIZATION Summary of this function goes here
%   Detailed explanation goes here

[sz1 sz2 sz3]=size(iris_image) %returns a row vector whose elements are the lengths of the corresponding dimensions of iris image. 
szx=sz2;
szy=sz1;

% figure(4); 

figure('Name','Iris Recognition: Normalization process','Position', [800 1000 700 500]),image(iris_image)
hold all;
Cx=floor(szx/2); Cy=floor(szy/2);
plot(Cx,Cy,'co');

% 
% %------ outer ring

p = pi
x = 2*p*outer_radii;
length = floor(x)
center_x = floor((outer_center(1)+inner_center(1))*.5)
center_y = floor((outer_center(2)+inner_center(2))*.5)
 
% hold all;
% subplot(2,3,1),imshow(iris_image)
% Cx=floor(szx/2); Cy=floor(szy/2);
% subplot(2,3,1),plot(Cx,Cy,'co');

plot(center_x,center_y,'r*');                                                        % check avg centre circle is not aligned to figure centre
plot([center_x 1],[center_y 1],'r-.');

theta=[45:360/length:404+1-360/length];                                         % if step=1 then we only get 360 points but need an amount of L points
                                                                                % if angle step 1/L over minute waiting for for loop to finish
outer_radius=outer_radii+5;

outer_perimeter_x=outer_radius*sind(theta)+center_x;
outer_perimeter_y=outer_radius*cosd(theta)+center_y;                  % build outer perimeter
hL1=plot(outer_perimeter_x,outer_perimeter_y,'m'); % axis equal;grid on;  
hold on;
plot(hL1.XData,hL1.YData,'ro');


% %--- inner ring
                                                                               
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
% outer_Sx=zeros(ceil(outer_radius),1);
% outer_Sy=zeros(ceil(outer_radius),1);
outer_Sx={};
outer_Sy={};

inner_Sx={};
inner_Sy={};


hold all;

for k=1:1:numel(hL1.XData)
    outer_Lx=floor(linspace(outer_x_ref(k),inner_x_ref(k),ceil(outer_radius)))
    outer_Ly=floor(linspace(outer_y_ref(k),inner_y_ref(k),ceil(outer_radius)))
%     
%    inner_Lx=floor(linspace(inner_x_ref(k),center_x,ceil(inner_radius)))
%    inner_Ly=floor(linspace(inner_y_ref(k),center_y,ceil(inner_radius)))
    
    plot(outer_Lx,outer_Ly,'go');    % check 
%    plot(inner_Lx,inner_Ly,'b')
%    plot([inner_Lx outer_Lx], [inner_Ly outer_Ly],'go')
    plot([perimeter_x(k) outer_perimeter_x(k)],[perimeter_y(k) outer_perimeter_y(k)],'r');
%   outer_L1=unique([outer_Lx;outer_Ly]','rows');
    
    outer_Sx=[outer_Sx outer_Ly'];
    outer_Sy=[outer_Sy outer_Lx'];
end

% for k=1:1:numel(hL2.XData)
%     inner_Lx=floor(linspace(inner_x_ref(k),center_x,ceil(inner_radius)))
%     inner_Ly=floor(linspace(inner_y_ref(k),center_y,ceil(inner_radius)))
%     plot(inner_Lx,inner_Ly,'b');    % check
%     plot([center_x perimeter_x(k)],[center_y perimeter_y(k)],'b');
%     inner_L1=unique([inner_Lx;inner_Ly]','rows');
%     inner_Sx=[inner_Sx inner_Lx'];inner_Sy=[inner_Sy inner_Ly'];
% end


sx=cell2mat(outer_Sx);sy=cell2mat(outer_Sy)

% outer_sx=cell2mat(outer_Sx);outer_sy=cell2mat(outer_Sy);
% inner_sx=cell2mat(inner_Sx);inner_sy=cell2mat(inner_Sy);

% sx = outer_sx - inner_sx
% sy = outer_sy - inner_sy
% [s1 s2]=size(outer_sx);
[s1 s2] = size(sx) 


B1=uint8(zeros(s1,s2));
B2=uint8(zeros(s1,s2));
B3=uint8(zeros(s1,s2));

for n=1:1:s2
    for k=1:1:s1
        B1(k,n)=iris_image(sx(k,n),sy(k,n)); 
        B2(k,n)=iris_image(sx(k,n),sy(k,n)); 
        B3(k,n)=iris_image(sx(k,n),sy(k,n)); 
    end
end
figure('Name','Iris Recognition: Normalization','Position', [0 0 700 500]),
C=uint8(zeros(s1,s2,3));
C(:,:,1)=B1;
C(:,:,2)=B2;
C(:,:,3)=B3;
normalized_image = C
imshow(normalized_image)
end

