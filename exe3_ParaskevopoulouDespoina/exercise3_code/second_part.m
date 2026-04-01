%% Balls and Bins 
clc; clear all; close all;

n = 500; m = 1000;
K = 1000;
empty_bins = balls_bins_empty(n,m,K);

theoretic_mean = n*(1-1/n)^m;
fprintf('Statistical mean of empty bins: %.3f\n', theoretic_mean);
arithm_mean = sum(empty_bins)/K;
fprintf('Arithmetic mean of empty bins (experimental): %.3f\n',arithm_mean);

figure;
bin_edges = 0:(n-1);
histogram(empty_bins, 'BinEdges', bin_edges, 'Normalization', 'probability');
title(['\textbf{Empty bins for n = ', num2str(n), ', m = ',num2str(m),', K = ', num2str(K), '}'], ...
          'interpreter', 'latex');
xlabel('Number of Empty Bins', 'interpreter', 'latex');
ylabel('Probability Density', 'interpreter', 'latex');
grid on;

