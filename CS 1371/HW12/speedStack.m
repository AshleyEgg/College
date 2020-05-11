function [pyr]=speedStack(len,symbol)
if len==1%If we are at the top of the pyramid
    pyr=symbol;
else
    pyr=helper(symbol,len,0);
end
end

function [final]=helper(sym,len,count)
if len>0
    curr=[];
    for i=1:len
        curr=[curr,sym,' '];
    end
    curr=curr(1:end-1);
    spaces=[];
    for j=1:count
        spaces=[spaces,' '];  
    end
    curr=[spaces,curr,spaces];

     final=[helper(sym,len-1,count+1);curr];
else
    final=[];
end

end