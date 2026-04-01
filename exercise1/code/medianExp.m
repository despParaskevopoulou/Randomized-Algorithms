function [N,medians,N_th] = medianExp(n)
    N = zeros(size(n));        
    medians = zeros(size(n));  
    
    for i = 1:length(n)        
        S = randperm(n(i));   
        comp_count = 0;
        comp_count_th = 0;

        [median_val, comp_exp,comp_th] = findMedian(S);  
        comp_count = comp_count + comp_exp;   
        comp_count_th = comp_count_th  + comp_th;
        
        if (median_val ~= -1)  
            medians(i) = median_val;         
            N(i) = comp_count;   
            N_th(i) = comp_count_th;
        end
    end
end
