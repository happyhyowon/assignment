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

figure('Name', 'original square');
imagesc(img);

[row, column] = size(img);
for i=1:row
    dx(i, :) = diff(img(i, :));
end

for i=1:column
    dy(:, i) = diff(img(:, i));
end

figure('Name', 'dx of square');
imagesc(dx);

figure('Name', 'dy of square');
imagesc(dy);

%% another image derivative
clc; clear all; close all;
lena = imread('lena.png');
[row, column, channel] = size(lena);

figure('Name', 'original image');
imagesc(lena);

for i=1:channel
    for j=1:row
        dx(j, :, channel) = diff(lena(j, :, channel));
    end

    for j=1:column
        dy(:, j, channel) = diff(lena(:, j, channel));
    end
end

figure('Name', 'dx');
imagesc(dx);

figure('Name', 'dy');
imagesc(dy);