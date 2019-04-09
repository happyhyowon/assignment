% testDerivative : This is a script for image derivative
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

% simple function for generating square image
imf = @(x, y) (x >= 30 & x <= 70) & (y >= 30 & y <= 70);

% generate 150 x 150 meshgrid
[x, y] = meshgrid(1:150, 1:150);

% generate 41 x 41 square
img = double(imf(x, y));

% show original square image
figure('Name', 'original square');
imagesc(img);

% get size of original square image
[row, column] = size(img);
% calculate x-derivative
for i=1:row
    dx(i, :) = diff(img(i, :));
end

% calculate y-derivative
for i=1:column
    dy(:, i) = diff(img(:, i));
end

% show x-derivative image
figure('Name', 'dx of square');
imagesc(dx);

% show y-derivative image
figure('Name', 'dy of square');
imagesc(dy);

%% another image derivative (optional)
% Initialization
clc; clear all;
close all;

% read image of sana who is korean famous singer
sana = imread('sana.jpg');
[row, column, channel] = size(sana);

% show original sana image
figure('Name', 'original image');
imagesc(sana);
axis image; % for maintaining aspect ratio

% index for channel-wise derivative
for i=1:channel
    % index for row-wise derivative
    for j=1:row
        dx(j, :, i) = diff(sana(j, :, i));
    end

    % index for column-wise derivative
    for j=1:column
        dy(:, j, i) = diff(sana(:, j, i));
    end
end

% show x-derivative image
figure('Name', 'dx of sana image');
imagesc(255- dx);
axis image; % for maintaining aspect ratio

% show y-derivative image
figure('Name', 'dy of sana image');
imagesc(255 - dy);
axis image; % for maintaining aspect ratio