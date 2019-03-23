% yyyymmdd2secs : It is a user defined function to convert input data as 
%                 birth day to sec
%
% INPUTS : birth day of member struct(string type data)
%
% OUTPUT : secOfLife(double type data)
%        
% created  : 2019/03/18
% modified : 2019/03/23

function secOfLife = yyyymmdd2secs(birth)
bYear = (uint64(birth(1) - '0') * 1000) + (uint64(birth(2) - '0') * 100) + (uint64(birth(3) - '0') * 10) + uint64(birth(4) - '0');
bMonth = (uint64(birth(5) - '0') * 10) + uint64(birth(6) - '0');
bDay = (uint64(birth(7) - '0') * 10) + uint64(birth(8) - '0');
bTime = 24; % 12 AM

currentDay = uint64(clock);

% abnormal case : error print
if currentDay(4) < bYear || currentDay(3) < bMonth || currentDay(2) < bDay
    currentDay(1) = currentDay(1) - 1;
    currentDay(2) = currentDay(2) + 11;
    currentDay(3) = currentDay(3) + 29;
    currentDay(4) = currentDay(4) + 24;
end

% 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31
% calculate life time expressed in sec
HourtoSec = 60 * 60;
DayToSec = 24 * HourtoSec;
MonthToSec = 30 * DayToSec;
YearToSec = MonthToSec * 365;
temp_sec(1) = uint64((currentDay(1) - bYear) * 365 * 24 * 60 * 60);
temp_sec(2) = uint64((currentDay(2) - bMonth) * 30 * 24 * 60 * 60);
temp_sec(3) = uint64((currentDay(3) - bDay) * 24 * 60 * 60);
temp_sec(4) = uint64((currentDay(4) - bTime) * 60 * 60);
temp_sec(5) = uint64(currentDay(5) - 0);
temp_sec(6) = uint64(currentDay(6) - 0);

% return output data
secOfLife = uint64(sum(temp_sec));
