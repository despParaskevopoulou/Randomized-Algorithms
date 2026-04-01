%% 2-SAT, Exercise 4 part 2
n = 10^2; K = 10^2;
x = zeros(1,n);
for i=1:n
    x(i) = randi([0 1]);
end

%% 1
clauses = zeros(K,2);

for i=1:K
    clauses(i,:) = randperm(n,2);
end

%% 2
S = zeros(1,n);

for i=1:n
    S(i) = randi([0 1]);
end

%% 3
lit_clauses = zeros (K,2);

for i = 1:K
    index = randi([1 2]);
    if(index==1)
        if(S(clauses(i,1))==0)
            lit_clauses(i,1) = 1;
        end
    end
    if(index==2)
        if(S(clauses(i,2))==0)
            lit_clauses(i,2) = 1;
        end
    end
end

iter = 0; m = 10; max_iter = 2*m*n^2;

%% 5
while (iter<=max_iter)
    iter = iter+1;
    
    pos_sat_clause = check_2SAT(x,clauses,lit_clauses,K);
    
    if all(pos_sat_clause==1)
        fprintf('Truth assignment found!\n');
        break;
    else
        unsat = find(pos_sat_clause==0);
        rnd = randi(length(unsat));
        rnd_clause = unsat(rnd);
        literal = clauses(rnd_clause,randi(2));
        x(literal) = ~x(literal);
    end

    if iter == 2*m*n^2
        fprintf('Unsatisfiable!\n');
    end
    
end

fprintf('Iterations for finding truth assignment: %d\n',iter);
