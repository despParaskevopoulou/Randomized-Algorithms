function is_valid = verify_hamiltonian_cycle(path,n,adjMatrix)
   
    if length(path) ~= n+1
        disp('Cycle verification failed: Incorrect cycle length.');
        is_valid = false;
        return;
    end
 
    if path(1) ~= path(end)
        disp('Cycle verification failed: Start and end nodes do not match.');
        is_valid = false;
        return;
    end
    
    if length(unique(path(1:end-1))) ~= n
        disp('Cycle verification failed: Not all nodes are unique.');
        is_valid = false;
        return;
    end

    for i=length(path)-1
        if(adjMatrix(path(i),path(i+1))==0)
            is_valid = false;
            return;
        end
    end

    is_valid = true;
end