%% Randomized Algorithms

%% Maximum Load in n-Balls and n-Bins
clear all;
close all; clc;
k = 1;
n = 10^k;
K = 100;

max_loads = balls_bins_rep(n,K);

L = log(n) / log(log(n));
M = 3*L;

figure;
scatter(1:K, max_loads, 'Marker', '*');
yline(L, '--', 'Color', [1 0 0], 'LineWidth', 2,'DisplayName', sprintf('L for n=%d', n));
yline(M, '--', 'Color', [0 0 1], 'LineWidth', 2,'DisplayName', sprintf('M for n=%d', n));
title('K maximum loads vs Probability Bounds', 'interpreter', 'latex');
xlabel('Experiment Number (k)', 'interpreter', 'latex');
ylabel('Maximum Loads', 'interpreter', 'latex');
legend('Maximum Loads','Probability Lower Bound','Probability Upper Bound','Location', 'best', 'interpreter', 'latex');
ylim([1 M+2]);
grid on;