%% Deterministic MAX-CUT algorithm
function max_cut_det = max_cut_deter(n,G,A,B,m,order)
    cutD_found = false;
    max_cut_det = 0;
    A = [A,order(1)];
    
    for v=2:n
        n_in_A = sum(G(v,A)); % neighbors in A
        n_in_B = sum(G(v,B));
    
        if n_in_A <= n_in_B
            A = [A,v];
        else
            B = [B,v];
        end
    end
    
    for i=A
        for j=B
            max_cut_det = max_cut_det + G(i,j);
        end
    end
    
    if (max_cut_det>=m/2)
        cutD_found = true;
    end

end