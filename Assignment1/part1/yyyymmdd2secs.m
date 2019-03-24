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

% initial value
secOfLife = NaN;
last_year_sum = 1;

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

% last_year_sum += (y - my_year - 1) * 365; // 시작과 끝년도 빼고 * 365 
last_year_sum = uint64(last_year_sum + ((cYear - bYear - 1) * 365));

for cnt = (bMonth+1):12
    last_year_sum = (last_year_sum + (guulMonth(cnt)));
end
last_year_sum = (last_year_sum + (guulMonth(bMonth) - bDay));

for cnt = 1:(cMonth - 1)
    last_year_sum = (last_year_sum + (guulMonth(cnt)));
end
last_year_sum = (last_year_sum + (cDay));

% calculate time expressed in sec
last_year_sum = last_year_sum * 24 * 60 * 60;
last_year_sum = last_year_sum + (cTime * 60 * 60) + (cMin * 60) + cSec;

% return output data
secOfLife = uint64(last_year_sum);
return