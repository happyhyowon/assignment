% teamStats : This is a script that create a 'teamStats.txt' which contains
%             some information of our team members.
%
% INPUTS : X
%
% OUTPUT : teamStats.txt
%
% created : 2019/03/18
% modified : 2019/03/22

% Initialization
clear all; clc;
close all;

% Load team member's information
load('memberData.mat')

% Calculating each member's lifetime expressed in seconds
for i = 1:3
    member(i).age_in_seconds = yyyymmdd2secs(member(i).birthday);
end

% Create output file
file = fopen('teamStats.txt', 'w');

% Write down our team member's information (first name, last name,
% birthday, lifetime expressed in seconds)
for i=1:size(member, 2)
    fprintf(file, '%s\n', member(i).firstname);
    fprintf(file, '%s\n', member(i).lastname);
    fprintf(file, '%s / %s / %s\n', member(i).birthday(1:4), member(i).birthday(5:6), member(i).birthday(7:8));
    fprintf(file, '%d\n', member(i).age_in_seconds);
end

% Close file stream
fclose(file);