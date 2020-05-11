function [word]=int2word(num)
%Takes in a double and turns it into a word
names={'one','two','three','four','five','six','seven','eight','nine','ten','eleven','twelve','thirteen','fourteen','fifteen','sixteen','seventeen','eighteen','nineteen'};
prefix={'ten','twenty','thirty','fourty','fifty','sixty','seventy','eighty','ninety'};
hun='hundred';
word='';%Intilizes the word
if num==0%If it is a zero 
    word='zero';
elseif 100<=abs(num)%If the number is greater than 100
    first=floor(abs(num)/100);%Gets first digit
    temp1=abs(num)-(100*first);
    second=floor(temp1/10);%Gets second digit
    temp2=abs(temp1)-(10*second);
    third=floor(temp2);%Gets third digit
    word=[word,names{first},' ',hun];
    if second>0&&second~=1%If the second number is not 0
        word=[word,' and ',prefix{second}];
    end        
    if third>0%If the third number is not 0
        if second==0%If the seocond digit is 0 but the third is not
            word=[word,' and'];
        end 
        if second==1
            num=second*10+third;
            word=[word,' ',names{num}]; 
        else
            word=[word,'-',names{third}]; 
        end
               
    end
    
elseif abs(num)<=99&&abs(num)>=20%If the number is double digits
    first=floor(abs(num)/10);%Gets first digit
    temp=abs(num)-(10*first);
    second=floor(temp);%Gets second digit
    word=[word,prefix{first}];
    if second>0%If second is not zero
        word=[word,'-',names{second}];
    end
elseif abs(num)<=19&&abs(num)>=1%If the numbers is less than 20
    word=names{num};
end

%Adds negative on last
if num<0
    word=['negative ',word];
end
end