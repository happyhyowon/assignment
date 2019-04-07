% testDerivative : This is a script for testing a derive function
%   Input variables
%       None
%   Output variables
%       None
%
%   created : 2019/04/07
%   modified : 2019/04/07
% Initialization
close all;
clear all; clc;

%% sin 함수의 미분과 cos함수 비교
% define x, derivative for sin and cos
x_values = [-pi:0.1:pi];
d = derive(@sin, x_values, 0.1);
f = cos(x_values);

% plot cos and derivative for sin
figure('Name', 'Comparison d with f');
title('comparison d with f');
plot(x_values, d, 'g'); hold on;
plot(x_values, f, 'r');

%% 위에서 계산한 두 함수의 에러 그래프
% calculate errors between two functions for each h value decreasing a factor of 2
h = 1;
for step=1:10
   d = derive(@sin, x_values, h);
   err(step) = sum((d - f).^2) ^ 0.5;
   hvalues(step) = h;
   h = h/2;
end

% plot errors between two functions
% h = 0.001953 (약 2^(-9))일 때, error가 10^-2보다 작아짐
figure('Name', 'Errors');
loglog(hvalues, err, 'ro-'); grid

%% derivative test for log function
% x values for log function
x = [0.1:0.1:5];

% real derivative for log function
f = @(x) 1 ./ x;

% our derivative using derive function
d = derive(@log, x, 2^-9);

% plot both real derivative and approximated derivative
figure('Name', 'derivative for log function');
plot(x, d, 'g-'); hold on;
plot(x, f(x), 'r-');

%% derivative test for 1/(x^0.5) function
% x values for log function
x = [0.1:0.1:5];

% define 1/(x^0.5) function
original_f = @(x) 1 ./ (x.^0.5);

% real derivative for 1/(x^0.5) function
f = @(x) -0.5 * (x .^ -(2/3));

% our derivative using derive function
d = derive(original_f, x, 2^-9);

% plot both real derivative and approximated derivative
figure('Name', 'derivative for 1/(x^0.5) function');
plot(x, d, 'g-'); hold on;
plot(x, f(x), 'r-');

%% derivative test for sin(x)/(x+5) function
% x values for log function
x = [-5.01:0.1:0];

% define sin(x)/(x+5) function
original_f = @(x) sin(x) ./ (x+5);

% real derivative for sin(x)/(x+5) function
f = @(x) -((cos(x).*(x+5) - sin(x)) ./ ((x+5).^2));

% our derivative using derive function
d = derive(original_f, x, 2^-9);

% plot both real derivative and approximated derivative
figure('Name', 'derivative for 1/(x^0.5) function');
plot(x, d, 'g-'); hold on;
plot(x, f(x), 'r-');