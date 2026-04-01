clear all; close all; clc;
n_values = [100,200,500, 1000,2000,4000];  
iterations = zeros(size(n_values));  

for idx = 1:length(n_values)
    n = n_values(idx);
    K = 3*n;  
   
    x = randi([0 1], 1, n);

    clauses = zeros(K, 3);
    for i=1:K
        clauses(i,:) = randperm(n,3);
    end

    S = zeros(1,n);

    for i=1:n
        S(i) = randi([0 1]);
    end
    
    %% 3
    lit_clauses = zeros (K,3);

    for i = 1:K
    index = randi([1 3]);
    if(index==1)
        if(S(clauses(i,1))==0)
            lit_clauses(i,1) = 1;
        end
        if rand() < 0.5
            lit_clauses(i,2) = 1;
        end
    end
    if(index==2)
        if(S(clauses(i,2))==0)
            lit_clauses(i,2) = 1;
            
        end
        if rand() < 0.5
            lit_clauses(i,3) = 1;
        end
    end
    if (index==3)
        if(S(clauses(i,3))==0)
            lit_clauses(i,3) = 1;
        end
        if rand() < 0.5
            lit_clauses(i,1) = 1;
        end
    end
end

    iter = 0; 
    m = 10; 
    max_iter = 2 * m * n^2;

    while iter <= max_iter
        iter = iter + 1;
        
        pos_sat_clause = check_3SAT(x, clauses, lit_clauses, K);
        
        if all(pos_sat_clause == 1)
            fprintf('Truth assignment found for n = %d after %d iterations.\n', n, iter);
            break;
        else
            unsat = find(pos_sat_clause == 0);
            rnd = randi(length(unsat));
            rnd_clause = unsat(rnd);
            literal = clauses(rnd_clause, randi(3));
            x(literal) = ~x(literal);
        end

        if iter == max_iter
            fprintf('Unsatisfiable for n = %d!\n', n);
        end
    end
    
    iterations(idx) = iter;
end

ratios = n_values ./ iterations;
average_ratio = mean(ratios);
fprintf('Average Ratio (n / Iterations): %.2f\n', average_ratio);

figure;
plot(n_values, iterations, '-o', 'LineWidth', 2);
xlabel('$n$ (Problem Size)', 'Interpreter', 'latex');
ylabel('Iterations', 'Interpreter', 'latex');
title('Iterations vs Problem Size ($n$)', 'Interpreter', 'latex');
grid on;