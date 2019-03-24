% processData: This is a script that analyzing some example data

%   Input variables
%       X
%   Output variables
%       analysis.fig : Graphs for each variable including means and SEMs 
%       analysis2.fig : Scatter plots for relationships between variables
%
%   created : 2019/03/22
%   modified : 2019/03/24

% Initialization
clc; clear all; close all;

% Load sample data
load('experimentData');

% convert table to array
datas = table2array(experimentData);

% get counts for samples and variables
[sampleNum varNum] = size(datas);

% calculate means and SEMs for heart rate, weight and exercise
[means SEMs] = meanSEM(datas);

% draw graphs for each variable including means and SEMs
participants = 1:sampleNum;

% create new window
figure('Name', 'Analysis1');

% helper variable for drawing plots
ylabels = ["Heart rate", "Weight", "Exercise"];
% draw plots
for i=1:3
    % set i-th graph
    subplot(3, 1, i); hold on;
    
    % create x, y labels
    xlabel('participants');
    ylabel(ylabels(i));
    
    % plot red line for i-th datas 
    plot(datas(:, i), 'r');
    
    % plot mean for i-th variable
    plot(participants, repmat(means(i), 1, sampleNum), 'b-');
    
    % plot SEM for i-th variable
    plot(participants, repmat(means(i) + SEMs(i), 1, sampleNum), 'b--')
    plot(participants, repmat(means(i) - SEMs(i), 1, sampleNum), 'b--');
end

% save plots
saveas(gcf, 'analysis.fig');

% draw scatter plots for relationships between variables
% create new window
figure('Name', 'Analysis2');

% helper variables for drawing scatter plots
dataIndecies = [1 2; 1 3; 2 3];
ylabels = [["Heart rate", "Weight"],
           ["Heart rate", "Exercise"],
           ["Weight", "Exercise"]];
       
% draw scatter plots
for i=1:3
    % set i-th graph
    subplot(3, 1, i); hold on;
    
    % create x, y labels
    xlabel(ylabels(i, 1));
    ylabel(ylabels(i, 2));
    
    % plot points for relationships between variables
    scatter(datas(:, dataIndecies(i,1)), datas(:, dataIndecies(i,2)));
end

% save scatter plots
saveas(gcf, 'analysis2.fig');

% Interpretation of data
% The data distribution showed that among the people with similar weights, 
% the heart rate was lower in a group that exercised hard.
% Therefore, there is an inverse relationship between exercise time and heart rate, 
% and weight does not seem to have a significant effect on heart rate.