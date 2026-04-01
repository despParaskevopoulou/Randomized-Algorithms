%% Large-Cut Problem
t = 3;
n = 10^t;
p = 10^(-1);

[G,m] = rand_graph(n,p);


fprintf('Large Cut should be at least: %.0f\n', m/2);

% randomized version
[max_cut,iter] = max_cut_Random(n,G,m);
fprintf('Randomized large cut is : %d, found in %d iterations',max_cut,iter);
disp(' ');

% deterministic version
Ad = []; Bd = [];
order = 1:n;

max_cut_det = max_cut_deter(n,G,Ad,Bd,m,order);
fprintf('Deterministic large cut is : %d',max_cut_det);
disp(' ');




