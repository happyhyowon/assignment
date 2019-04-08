% testDerivative : This is a script for derive images
%   Input variables
%       None
%   Output variables
%       None
%
%   created : 2019/04/07
%   modified : 2019/04/09
% Initialization
close all;
clear all; clc;

imf = @(x, y) (x >= 30 & x <= 70) & (y >= 30 & y <= 70);
[x, y] = meshgrid(1:150, 1:150);
img = double(imf(x, y));

figure(1);
imagesc(img);

[row, column] = size(img);
for i=1:row
    dx(row, :) = diff(img(row, :));
end

for i=1:column
    dy(:, column) = diff(img(:, column));
end

figure(2);
imagesc(dx);

figure(3);
%imagesc(dy);

%% another image derivative
clc; clear all; close all;
lena = imread('lena.png');
[row, column] = size(lena);

for i=1:row
    dx(row, :) = diff(lena(row, :));
end

for i=1:column
    dy(:, column) = diff(lena(:, column));
end

figure(1);
imshow(dx);

figure(2);
imshow(dy);