function [count1,count2,success] = hamiltonian_cycle_func(n,q,p)
adjMatrix = zeros(n);

for i =1:n
    for j=(i+1):n
        if rand() < p
            adjMatrix(i,j) = 1;
        elseif rand() >= p
            adjMatrix(i,j) = 0;
        end
    end
end

adjMatrix = adjMatrix + adjMatrix';
usedEdges = cell(1,n);
unusedEdges = cell(1,n);

for i = 1:n
    for j = (i+1) : n
        if(adjMatrix(i,j)==1)
            w = rand();
            if w <  q
                unusedEdges{i} = [unusedEdges{i},j];
            elseif w<p
                unusedEdges{j} = [unusedEdges{j},i];
            else
                unusedEdges{i} = [unusedEdges{i},j];
                unusedEdges{j} = [unusedEdges{j},i];
            end
        end
    end
end

for i=1:n
    unusedEdges{i} = unusedEdges{i}(randperm(length(unusedEdges{i})));
end

% random vertex as head
head = randi(n);
path = [head];
circle_found = false;
path_found = false;

count1 = 0;

while ~path_found
    r = rand();

    count1 = count1+1;

    if length(path) == n
        fprintf('Path found, iterations: %d \n',count1);
        break; % Hamiltonian path found
    end
        
    if isempty(unusedEdges{head})
        fprintf('Path NOT found, iterations: %d \n',count1);
        path_found = false;
        break;
    end

    if r<1/n
        head = path(1);
        path = flip(path);
    elseif r < 1/n + length(usedEdges{head})/n
      %  v = select_vertex(usedEdges);
        v = usedEdges{head}(randi([1,length(usedEdges{head})]));
        [exists,position] = check_vertex(path,v);
       
        if exists
            head = path(position+1);
            path = rotate_path(path,position);      
        end
    else 
        v = unusedEdges{head}(1);
        unusedEdges{head}(1) = [];
        usedEdges{head} = [usedEdges{head},v];

    %    v = select_vertex(unusedEdges);
        [exists,position] = check_vertex(path,v);
        if ~exists
            head = v;
            path = [path,v];
        else
            if position == length(path)
                        head = path(1);
                        path = rotate_path(path,position);
                else
                        head = path(position+1);
                        path = rotate_path(path,position);
                    end
        end
    end

    if isempty(unusedEdges)
         error('FAIL: Unused edges exhausted, iterations; %d \n',count1);
    end
        
    if count1 > 2 * n * log(n)
        fprintf('FAIL: Maximum iteration limit exceeded for path, iterations; %d \n',count1);
        break;
    end

end
count2 = 0;

while circle_found==false
    r = rand;

    count2 = count2+1;
        
    if isempty(unusedEdges{head})
        fprintf('Cycle NOT found, iterations: %d \n',count2);
        circle_found = false;
        break;
    end

    if r<1/n
        head = path(1);
        path = flip(path);

    elseif r < 1/n + (length(usedEdges{head})/n)
        v = usedEdges{head}(randi([1,length(usedEdges{head})]));
        [exists,position] = check_vertex(path,v);
        if exists
            head = path(position+1);
            path = rotate_path(path,position);
        end

    else 
        v = unusedEdges{head}(1);
        unusedEdges{head}(1) = [];
        usedEdges{head} = [usedEdges{head},v];

        [exists,position] = check_vertex(path,v);
        if v==path(1)
            path = [path,path(1)];
            circle_found = true;
            fprintf('Cycle found, iterations: %d\n',count2);
            break;
        else
            if ~exists
                path = [path,v];
                head = v;
            else
               if position == length(path)
                        head = path(1);
                        path = rotate_path(path,position);
               else
                        head = path(position+1);
                        path = rotate_path(path,position);
               end  
            end
        end
    end

    if isempty(unusedEdges)
         error('FAIL: Unused edges exhausted, iterations; %d \n',count2);
    end
        
    if count2 >  n * log(n)
        fprintf('FAIL: Maximum iteration limit exceeded for path, iterations; %d \n',count2);
        break;
    end
    
end

is_valid = verify_hamiltonian_cycle(path,n,adjMatrix);

if is_valid
        success = 1;
    else
        success = 0;
end
end