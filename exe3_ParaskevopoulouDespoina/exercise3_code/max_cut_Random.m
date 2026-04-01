%% Randomized Algorithm for MAX-CUT
function [max_cut,iter] = max_cut_Random(n,G,m) 
    iter = 0; cut_found = false;
    
    while(iter < m/2 +1)
        A = []; B = [];
        max_cut=0;
        iter = iter+1;

        for v=1:n
            if rand() < 0.5
                A = [A,v];
            else
                B = [B,v];
            end
        end
    
        for i=A
            for j=B
                max_cut = max_cut + G(i,j);
            end
        end
        
        if (max_cut>=m/2)
            cut_found = true;
            break;
        end
    end
end