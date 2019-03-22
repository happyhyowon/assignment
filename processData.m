% preamble
clc; clear all; close all;

load('experimentData');
datas = table2array(experimentData);

participant = 1:size(datas, 1);

[means SEMs] = meanSEM(datas);

figure(1);
ylabels = ["Heart rate", "Weight", "Exercise"];
for i=1:3
    subplot(3, 1, i); hold on;
    xlabel('participants');
    ylabel(ylabels(i));
    plot(datas(:, i), 'r');
    yline(means(i));
    yline(means(i) + SEMs(i), 'b--');
    yline(means(i) - SEMs(i), 'b--');
end
saveas(gcf, 'analysis.fig');

figure(2);
dataIndecies = [1 2; 1 3; 2 3]
ylabels = [["Heart rate", "Weight"],
           ["Heart rate", "Exercise"],
           ["Weight", "Exercise"]];
for i=1:3
    subplot(3, 1, i); hold on;
    xlabel(ylabels(i, 1));
    ylabel(ylabels(i, 2));
    scatter(datas(:, dataIndecies(i,1)), datas(:, dataIndecies(i,2)));
end
saveas(gcf, 'analysis2.fig');