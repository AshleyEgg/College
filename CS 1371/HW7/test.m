function [out]=test(in)
vec = [2, 10, -8, 2, 0, 0, 5];
     idx = 1;
     prev = NaN;
     curr = vec(idx);
     tot = 0;
     while prev ~= curr
         idx = idx + 1;
         prev = curr;
         curr = vec(idx);
        if prev < curr
            tot = tot + curr;
        end
     end
end