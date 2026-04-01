%% Experiment Hamiltonian Cycle
clear all; close all;
clc;

n = 500;

K=40;  % number of experiments
success_count = 0;
q = 20*log(n)/n; p = 2*q - q^2;

[iter_path,iter_cycle] = hamiltonian_cycle_func(n,q,p);

for exp=1:K
    fprintf('Experiment %d\n', exp);

    [iter1,iter2,success] = hamiltonian_cycle_func(n,q,p);
    success_count = success_count+success;
end

probability_of_success = success_count / K;
fprintf('Probability of success over %d experiments: %.4f\n', K, probability_of_success);

fprintf('Probability of failure over %d experiments: %.4f\n', K,1- probability_of_success);




