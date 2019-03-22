% meanSEM: calculate mean and Standard Error of the Mean(SEM) from multiple
% datas
%   Input variables
%       data : datas (2-D matrix)
%   Output variables
%       means : mean of given datas (1-D vector)
%       SEM : Standard Error of the Mean for given datas (1-D vector)
%
%   created : 2019/03/22
%   modified : 2019/03/22

function [means, SEMs] = meanSEM(data)
% calculate means for given datas
means = mean(data);

% calculate SEM for given datas
stds = std(data);
SEMs = stds ./ sqrt(size(data, 1) - 1);