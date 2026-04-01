%% Randomized Algorithms

%% Coupon Collector Problem
clear all;
close all;
clc;

n = 1000;
K = 500;
hn = 0;
N = coupon_collector(n,K);

for i = 1:n
    hn = 1/i  + hn;
end
th_mean = n*hn;

fprintf('Coupon Collector Problem with n = %d, K = %d\n', n, K);
fprintf('Average number of selections: %.2f\n', mean(N));
fprintf('Theoretical Average number of selections: %.2f\n', th_mean);


x_vals = 1:K;
y_vals = N;
figure;
plot(x_vals,y_vals);
hold on;
title('Number of Selections Required vs Experiment Number', 'interpreter', 'latex');
xlabel('Experiment Number (k)', 'interpreter', 'latex');
ylabel('Number of Selections Required', 'interpreter', 'latex');
grid on;

yline(mean(N),'r--','LineWidth', 3);
yline(th_mean,'g','LineWidth', 2)
legend('Selections per Experiment', 'Mean Value','Theoretical Mean Value', 'Location', 'best', 'interpreter', 'latex');
hold off;

figure;
hist(N,20);
title(['\textbf{Coupon Collector: n = ', num2str(n), ', K = ', num2str(K), '}'], ...
          'interpreter', 'latex');
xlabel('Number of Selections', 'interpreter', 'latex');
ylabel('Probability Density', 'interpreter', 'latex');
grid on;

%% QuickSort
n = 1000;
K = 500;
hn = 0;
th_mean =0;

for i = 1:n
    hn = 1/i  + hn;
end
th_mean = 2*(n+1)*hn - 4*n;

[S,N,total_avg] = quick_sort_experiment(n,K);

fprintf('Number of comparisons: %.2f\n', N); % cumulative
fprintf('Average number of comparisons: %.2f\n', total_avg);
fprintf('Theoretical Mean Value: %.2f\n',th_mean);

x_vals = 1:K;
y_vals = N;
figure;
plot(x_vals,y_vals);
hold on;
title('Number of Comparisons Required vs Experiment Number', 'interpreter', 'latex');
xlabel('Experiment Number (k)', 'interpreter', 'latex');
ylabel('Number of Comparisons Required', 'interpreter', 'latex');
grid on;

yline(mean(N),'r--','LineWidth', 3);
yline(th_mean,'g','LineWidth', 2)
legend('Selections per Experiment', 'Mean Value','Theoretical Mean Value', 'Location', 'best', 'interpreter', 'latex');
hold off;


figure;
hist(N,20);
title(['\textbf{Quick Sort: n = ', num2str(n), ', K = ', num2str(K), '}'], ...
          'interpreter', 'latex');
xlabel('Number of Comparisons', 'interpreter', 'latex');
ylabel('Probability Density', 'interpreter', 'latex');
grid on;

%% Randomized Median
n = 200:200:10000;
[N,medians,N_th] = medianExp(n);

x_vals = n;
y_vals = N;
y_vals2 = N_th;

figure;
plot(x_vals, y_vals, '-','MarkerSize',7); 
hold on;
plot(x_vals, y_vals, 'x', 'MarkerSize', 4, 'MarkerFaceColor', 'b'); 
%hold on;
%plot(x_vals, y_vals2, '--', 'MarkerSize', 2, 'MarkerFaceColor', 'r'); 
title('Number of Comparisons Required vs n', 'interpreter', 'latex');
xlabel('n value', 'interpreter', 'latex');
ylabel('Number of Comparisons Required', 'interpreter', 'latex');
grid on;

