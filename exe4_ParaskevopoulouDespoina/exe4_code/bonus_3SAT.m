%% Exercise 4, bonus 3-SAT
clear all; close all; clc;
n_values = [50,100,150,200,250,300,325,350];
%n_values = [50,100,200,300,350];
K_values = 5*n_values;
iterations = zeros(size(n_values));
countf = 0;


for idx = 1:length(n_values)
    n = n_values(idx);
    K = K_values(idx);
    iter_runs = zeros(1,10);
    total_iter=0;

    for i = 1:1000
        x = zeros(1,n);
    
        for i=1:n
            x(i) = randi([0 1]);
        end
        
        %% 1
        clauses = zeros(K,3);
    
        for i=1:K
            clauses(i,:) = randperm(n,3);
        end
        
        %% 2
        S = zeros(1,n);
        
        for i=1:n
            S(i) = randi([0 1]);
        end
        
        %% 3
        lit_clauses = zeros(K,3);
        
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
        
        iter = 0; m = 10; max_iter = 2*m*n^2; found = 0; 
    
        %% 5
        while (iter<=max_iter)
            iter = iter+1;
            
            pos_sat_clause = check_3SAT(x,clauses,lit_clauses,K);
            
    
                if all(pos_sat_clause == 1)
                    fprintf('Truth assignment found for n = %d , K = %d after %d iterations.\n', n,K, iter);
                    found = 0;
                    break;
                else
                    unsat = find(pos_sat_clause == 0);
                    rnd = randi(length(unsat));
                    rnd_clause = unsat(rnd);
                    literal = clauses(rnd_clause, randi(2));
                    x(literal) = ~x(literal);
                end
    
            if iter == max_iter
                fprintf('Unsatisfiable for n = %d!\n', n);
                found = -1;
                countf = countf + 1;
            end
            
        end
    
        if found==0
            fprintf('Iterations for finding truth assignment: %d\n',iter);
        end
        total_iter = total_iter + iter;
      %  iterations(idx) = iter;
    end

    iterations(idx) = total_iter/1000;
end

fprintf('Process failed %d times.',countf);
%iterations = mean(iterations);

figure;
plot(n_values, iterations, '-o', 'LineWidth', 2);
xlabel('$n$ (Problem Size)', 'Interpreter', 'latex');
ylabel('Iterations', 'Interpreter', 'latex');
title('Iterations vs Problem Size ($n$)', 'Interpreter', 'latex');
grid on;



