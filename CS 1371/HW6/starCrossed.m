function [horo]=starCrossed(birth1,birth2,horoscope)
%Determines if two people are meant to be together based on their horoscope
[month1,day1]=strtok(birth1);%Breaks up day and month
[month2,day2]=strtok(birth2);
[sign1,col1]=helper(month1,str2double(day1));%Finds the sign and corresponding number for each person
[sign2,col2]=helper(month2,str2double(day2));
compat=horoscope(col1,col2);%Determines if the two are compatible

%Formats the output based on compatibility 
if compat
    horo=sprintf('A %s and a %s? Your stars are aligned! You are destined to be together.',sign1,sign2);
else
    horo=sprintf('Your stars are crossed...a %s and a %s can never be together.',sign1,sign2);
end
end

function [sign,col]=helper(month,day)
% Takes in a month and day and gives the sign of the person and the
% corresponding number
if strcmp('January',month)
    if day>=20
        sign='Aquarius';
        col=1;
    else
        sign='Capricorn';
        col=12;
    end
elseif strcmp('February',month)
    if day>=19
        sign='Pisces';
        col=2;
    else
        sign='Aquarius';
        col=1;
    end
elseif strcmp('March',month)
    if day>=21
        sign='Aries';
        col=3;
    else
        sign='Pisces';
        col=2;
    end
elseif strcmp('April',month)
    if day>=20
        sign='Taurus';
        col=4;
    else
        sign='Aries';
        col=3;
    end
elseif strcmp('May',month)
    if day>=21
        sign='Gemini';
        col=5;
    else
        sign='Taurus';
        col=4;
    end
elseif strcmp('June',month)
    if day>=21
        sign='Cancer';
        col=6;
    else
        sign='Gemini';
        col=5;
    end
elseif strcmp('July',month)
    if day>=23
        sign='Leo';
        col=7;
    else
        sign='Cancer';
        col=6;
    end
elseif strcmp('August',month)
    if day>=23
        sign='Virgo';
        col=8;
    else
        sign='Leo';
        col=7;
    end
elseif strcmp('September',month)
    if day>=23
        sign='Libra';
        col=9;
    else
        sign='Virgo';
        col=8;
    end
elseif strcmp('October',month)
    if day>=23
        sign='Scorpio';
        col=10;
    else
        sign='Libra';
        col=9;
    end
elseif strcmp('November',month)
    if day>=22
        sign='Sagittarius';
        col=11;
    else
        sign='Scorpio';
        col=10;
    end
elseif strcmp('December',month)
    if day>=22
        sign='Capricorn';
        col=12;
    else
        sign='Sagittarius';
        col=11;
    end
end
end