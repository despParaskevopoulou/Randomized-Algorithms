function [median,comp,comp_th] = findMedian(S)
    n = length(S);
    sample = ceil(n^(3/4));
    R = randsample(n,sample);
    comp_th = 0;
    comp = 0;

    [comp1,sorted_R] = quick_sort(R,length(R),1);
    comp = comp + comp1;
    comp_th = comp_th + length(R)*log(length(R));

    m = (n^(3/4))/2;
    di = floor(m - sqrt(n));
    ui = ceil(m + sqrt(n));

    d = sorted_R(di);
    u = sorted_R(ui);
    
    C = []; Cd = []; Cu = [];
    for i = 1:n
        comp = comp + 2;
        comp_th = comp_th  + 2;
        if(S(i) >= d && S(i) <= u)
            C = [C; S(i)];
        elseif(S(i) < d)
            Cd = [Cd; S(i)];
        else
            Cu = [Cu; S(i)];
        end
    end

    ld = length(Cd);
    lu = length(Cu);
    
    comp = comp+2;
    comp_th = comp_th + 2;
    if (ld>n/2 || lu>n/2)
        median = -1;
        return;
    end

    comp = comp+1;
    comp_th = comp_th + 1;
    if (length(C) <= 4*n^(3/4))
        [comp2,sorted_C] = quick_sort(C,length(C),1);
       % sorted_C = sort(C);
        comp_th = comp_th + length(C)*log(length(C));

        comp = comp  + comp2;

    else
        median = -1;
        return;
    end
    
    median_i = floor(n/2) - ld +1;
    median = sorted_C(median_i);
   
end