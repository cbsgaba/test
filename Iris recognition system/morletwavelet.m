function createfigure(cdata1, cdata2, cdata3, cdata4, cdata5)
%CREATEFIGURE(cdata1, cdata2, cdata3, cdata4, cdata5)
%  CDATA1:  image cdata
%  CDATA2:  image cdata
%  CDATA3:  image cdata
%  CDATA4:  image cdata
%  CDATA5:  image cdata

%  Auto-generated by MATLAB on 23-Jun-2022 12:34:45

% Create figure
figure1 = figure('Tag','Win_CWTFT_2D',...
    'Name','Continuous Wavelet Transform 2-D - Wavelet: MORL');
colormap(gray(222));

% Create axes
axes1 = axes('Parent',figure1,...
    'Position',[0.13 0.729264705882353 0.334659090909091 0.215735294117647]);
hold(axes1,'on');

% Create image
image(cdata1,'Parent',axes1,'CDataMapping','scaled');

% Create title
title('Original Data','FontSize',9);

% Uncomment the following line to preserve the X-limits of the axes
% xlim(axes1,[0.5 422.5]);
% Uncomment the following line to preserve the Y-limits of the axes
% ylim(axes1,[0.5 70.5]);
box(axes1,'on');
axis(axes1,'ij');
hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'Layer','top');
% Create colorbar
colorbar(axes1,'Position',...
    [0.474659090909091 0.743950617283951 0.0105820105820106 0.171851851851852]);

% Create axes
axes2 = axes('Parent',figure1,...
    'Position',[0.13 0.409632352941176 0.334659090909091 0.215735294117647]);
hold(axes2,'on');

% Create image
image(cdata2,'Parent',axes2,'CDataMapping','scaled');

% Create xlabel
xlabel('Modulus');

% Uncomment the following line to preserve the X-limits of the axes
% xlim(axes2,[0.5 422.5]);
% Uncomment the following line to preserve the Y-limits of the axes
% ylim(axes2,[0.5 70.5]);
box(axes2,'on');
axis(axes2,'ij');
hold(axes2,'off');
% Set the remaining axes properties
set(axes2,'Layer','top');
% Create colorbar
colorbar(axes2,'Position',...
    [0.474659090909091 0.424279835390946 0.0105820105820106 0.172839506172839]);

% Create axes
axes3 = axes('Parent',figure1,...
    'Position',[0.570340909090909 0.409632352941176 0.334659090909091 0.215735294117647]);
hold(axes3,'on');

% Create image
image(cdata3,'Parent',axes3,'CDataMapping','scaled');

% Create xlabel
xlabel('Angle');

% Uncomment the following line to preserve the X-limits of the axes
% xlim(axes3,[0.5 422.5]);
% Uncomment the following line to preserve the Y-limits of the axes
% ylim(axes3,[0.5 70.5]);
box(axes3,'on');
axis(axes3,'ij');
hold(axes3,'off');
% Set the remaining axes properties
set(axes3,'Layer','top');
% Create colorbar
colorbar(axes3,'Position',...
    [0.915 0.424279835390946 0.0105820105820106 0.172839506172839]);

% Create axes
axes4 = axes('Parent',figure1,...
    'Position',[0.13 0.11 0.334659090909091 0.215735294117647]);
hold(axes4,'on');

% Create image
image(cdata4,'Parent',axes4,'CDataMapping','scaled');

% Create xlabel
xlabel('Real part');

% Uncomment the following line to preserve the X-limits of the axes
% xlim(axes4,[0.5 422.5]);
% Uncomment the following line to preserve the Y-limits of the axes
% ylim(axes4,[0.5 70.5]);
box(axes4,'on');
axis(axes4,'ij');
hold(axes4,'off');
% Set the remaining axes properties
set(axes4,'Layer','top');
% Create colorbar
colorbar(axes4,'Position',...
    [0.474659090909091 0.124279835390947 0.0105820105820106 0.172839506172839]);

% Create axes
axes5 = axes('Parent',figure1,...
    'Position',[0.570340909090909 0.11 0.334659090909091 0.215735294117647]);
hold(axes5,'on');

% Create image
image(cdata5,'Parent',axes5,'CDataMapping','scaled');

% Create xlabel
xlabel('Imaginary part');

% Uncomment the following line to preserve the X-limits of the axes
% xlim(axes5,[0.5 422.5]);
% Uncomment the following line to preserve the Y-limits of the axes
% ylim(axes5,[0.5 70.5]);
box(axes5,'on');
axis(axes5,'ij');
hold(axes5,'off');
% Set the remaining axes properties
set(axes5,'Layer','top');
% Create colorbar
colorbar(axes5,'Position',...
    [0.915 0.124279835390947 0.0105820105820106 0.172839506172839]);

% uicontrol currently does not support code generation, enter 'doc uicontrol' for correct input syntax
% In order to generate code for uicontrol, you may use GUIDE. Enter 'doc guide' for more information
% uicontrol(...);

% uicontrol currently does not support code generation, enter 'doc uicontrol' for correct input syntax
% In order to generate code for uicontrol, you may use GUIDE. Enter 'doc guide' for more information
% uicontrol(...);

% uicontrol currently does not support code generation, enter 'doc uicontrol' for correct input syntax
% In order to generate code for uicontrol, you may use GUIDE. Enter 'doc guide' for more information
% uicontrol(...);

% uicontrol currently does not support code generation, enter 'doc uicontrol' for correct input syntax
% In order to generate code for uicontrol, you may use GUIDE. Enter 'doc guide' for more information
% uicontrol(...);

% uicontrol currently does not support code generation, enter 'doc uicontrol' for correct input syntax
% In order to generate code for uicontrol, you may use GUIDE. Enter 'doc guide' for more information
% uicontrol(...);

% uicontrol currently does not support code generation, enter 'doc uicontrol' for correct input syntax
% In order to generate code for uicontrol, you may use GUIDE. Enter 'doc guide' for more information
% uicontrol(...);

