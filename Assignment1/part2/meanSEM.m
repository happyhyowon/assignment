% meanSEM: calculate mean and standard error of the mean(SEM) from the data
%   Input variables
%       data : datas
%   Output variables
%       means : mean of given datas
%       SEM : standard error of the mean of given datas

function [means, SEMs] = meanSEM(data)
% calculate means of datas
means = mean(data);

% calculate SEM of datas
stds = std(data);
SEMs = stds ./ sqrt(size(data, 1) - 1);