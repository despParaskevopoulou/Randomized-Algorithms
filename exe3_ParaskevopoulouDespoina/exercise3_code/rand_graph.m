%% Random Graph Function
function [G,m] = rand_graph(n,p)
    G = zeros(n);
    m = 0; % number of edges
    
    for i =1:n
        for j=(i+1):n
            if rand() < p
                G(i,j) = 1;
                m = m+1;
            elseif rand() >= p
                G(i,j) = 0;
            end
        end
    end
    
    G = G + G';
end