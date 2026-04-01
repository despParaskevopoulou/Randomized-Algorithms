function [pivot,comps,left,right] = partition(S,high,low)
    n = length(S);
    pivot_i = randi([low, high]);
    pivot = S(pivot_i);
    comps=0; right=[]; left = [];

    for j = 1:length(S)
        if (S(j)< pivot)
            comps = comps + 1;
            left = [left,S(j)];
        end 
        if(S(j)>pivot)
            comps = comps + 1;
            right = [right,S(j)];
        end
    end
end