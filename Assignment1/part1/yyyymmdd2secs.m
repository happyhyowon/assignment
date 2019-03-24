% yyyymmdd2secs : It is a user defined function to convert input data as 
%                 birth day to sec
%
% INPUTS : birth day of member struct(string type data)
%
% OUTPUT : secOfLife(double type data)
%        
% created  : 2019/03/18
% modified : 2019/03/23

% 3 -> 1, 2월을 초로
% 5 -> 1, 2, 3, 4월을 초로
% sum(guulMonth(1:currentMonth-1) .* DayToSec)

function secOfLife = yyyymmdd2secs(birth)
guulMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
MintoSec = 60;
HourtoSec = 60 * 60;
DayToSec = 24 * HourtoSec;
MonthToSec = guulMonth .* DayToSec;
YearToSec = sum(MonthToSec);

% initial value
secOfLife = NaN;

% to change input parameter type to uint64
bYear = (uint64(birth(1) - '0') * 1000) + (uint64(birth(2) - '0') * 100) + (uint64(birth(3) - '0') * 10) + uint64(birth(4) - '0');
bMonth = (uint64(birth(5) - '0') * 10) + uint64(birth(6) - '0');
bDay = (uint64(birth(7) - '0') * 10) + uint64(birth(8) - '0');
bTime = 0; % 12 AM (fixed)

% to change current time type to uint64
currentDay = uint64(clock);
cYear = uint64(currentDay(1));
cMonth = uint64(currentDay(2));
cDay = uint64(currentDay(3));
cTime = uint64(currentDay(4));
cMin = uint64(currentDay(5));
cSec = uint64(currentDay(6));

% Exception for Invalid input
if bYear > cYear || (bMonth < 1 || bMonth > 12) || (bDay > guulMonth(bMonth))
    error("Invalid input!!");
end

% calculate time expressed in sec
if cMonth == 1
   cMonth = 0;
else
   cMonth = (cMonth-1) * sum(guulMonth(1:cMonth-1) .* DayToSec);
end

if bMonth == 1
   bMonth = 0;
else
   bMonth = (bMonth-1) * sum(guulMonth(1:bMonth-1) .* DayToSec);
end


myLifeSec = uint64(((bYear-1) * YearToSec) + bMonth + ((bDay-1) * DayToSec));
curSec = uint64(((cYear-1) *  YearToSec) + cMonth + ((cDay-1) * DayToSec) + (cTime * HourtoSec) + (cMin * MintoSec) + cSec);

% abnormal case : error print
if(myLifeSec > curSec)
    error('There is invalid birth day!!!')
    return
end

% calculate life time expressed in sec
temp_sec = uint64(curSec - myLifeSec);

% return output data
secOfLife = uint64(temp_sec);
return;
