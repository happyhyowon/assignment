% teamStats : 
%
% INPUTS :
%
% OUTPUT :
% EXAMPLE :
%
% created : 2019/03/18
% modified : 2019/01/18

clear all
clc

load('memberData.mat')

for i = 1:3
    member(i).age_in_seconds = yyyymmdd2secs(member(i).birthday);
end

file = fopen('teamStats.txt', 'w');

for i=1:size(member, 2)
    fprintf(file, '%s\n', member(i).firstname);
    fprintf(file, '%s\n', member(i).lastname);
    fprintf(file, '%s / %s / %s\n', member(i).birthday(1:4), member(i).birthday(5:6), member(i).birthday(7:8));
    fprintf(file, '%d\n', member(i).age_in_seconds);
end

fclose(file);