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
guulMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
HourtoSec = 60 * 60;
DayToSec = 24 * HourtoSec;
MonthToSec = 30 * DayToSec;
YearToSec = MonthToSec * 365;

% initial value
secOfLife = NaN;

% to change input parameter type to uint64
bYear = (uint64(birth(1) - '0') * 1000) + (uint64(birth(2) - '0') * 100) + (uint64(birth(3) - '0') * 10) + uint64(birth(4) - '0');
bMonth = (uint64(birth(5) - '0') * 10) + uint64(birth(6) - '0');
bDay = (uint64(birth(7) - '0') * 10) + uint64(birth(8) - '0');
bTime = 24; % 12 AM (fixed)

% to change current time type to uint64
currentDay = uint64(clock);
cYear = uint64(currentDay(1));
cMonth = uint64(currentDay(2));
cDay = uint64(currentDay(3));
cTime = uint64(currentDay(4));

% calculate time expressed in sec
myLifeSec = uint64((bYear *  YearToSec) + (bYear * MonthToSec) + (bDay * DayToSec) + (bTime * HourtoSec));
curSec = uint64((cYear *  YearToSec) + (cMonth * MonthToSec) + (cDay * DayToSec) + (cTime * HourtoSec));

% abnormal case : error print
if(myLifeSec < curSec)
    error('There is invalid birth day!!!')
    return
end

% calculate life time expressed in sec
temp_sec = uint64(curSec - myLifeSec);

% return output data
secOfLife = uint64(temp_sec);
return;
