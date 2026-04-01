%% Exercise 4 
%%  Johnson-Lindenstrauss Lemma
clear all; close all; clc;

%% 1
d = 1e4; m = 50;
X = randn(d,m);

%% 2
t = m*(m-1)/2; index = 1;
dist = zeros(1,t);

for i=1:m
    for j=i+1:m
        dist(index) = norm(X(:,i)-X(:,j));
        index = index + 1;
    end
end

%% 3
epsilon = 10^(-1); di = 10^(-1);
Q = t;
temp = 2*Q/di;
n = floor(6*log(temp)/(epsilon^2));
fprintf('The reduced dimension is n = %d\n',n);

%% 4
n_ = floor(n);
W = randn(n_,d);
W_ = W / sqrt(n_); 
Y = W_*X ;

%% 5,6
index = 1;
t2 = m*(m-1)/2;
dist_Y = zeros(1,t2);

figure;
hold on;
xlabel('Pair Index', 'Interpreter', 'latex');
ylabel('Distance', 'Interpreter', 'latex');
title('Pairwise Distances: $\sqrt{1 \pm \epsilon} \|X(:, i) - X(:, j)\|_2$ vs $\|Y(:, i) - Y(:, j)\|_2$', 'Interpreter', 'latex');
grid on;

for i=1:m
    for j=i+1:m
        dist_Y(index) = norm(Y(:,i)-Y(:,j));
        quant_1(index) = sqrt(1-epsilon)*norm(X(:,i)-X(:,j));
        quant_2(index) = sqrt(1+epsilon)*norm(X(:,i)-X(:,j));

        index = index + 1;
    end
end

scatter(1:t2, dist_Y, 40, 'r'); 
scatter(1:t2, quant_1, 40, 'g'); 
scatter(1:t2, quant_2, 40, 'b'); 


legend({'$\|Y(:, i) - Y(:, j)\|_2$', ...
        '$\sqrt{1 - \epsilon} \|X(:, i) - X(:, j)\|_2$', ...
        '$\sqrt{1 + \epsilon} \|X(:, i) - X(:, j)\|_2$'}, ...
        'Interpreter', 'latex', 'Location', 'best');

hold off;

%% 7
index = 1;
count = 0;
t3 = m*(m-1)/2;
for i=1:m
    for j=i+1:m
        dist_Y(index) = norm(Y(:,i)-Y(:,j));
        quant_1(index) = sqrt(1-epsilon)*norm(X(:,i)-X(:,j));
        quant_2(index) = sqrt(1+epsilon)*norm(X(:,i)-X(:,j));

        if ((dist_Y(index) >= quant_1(index)) && (dist_Y(index) <= quant_2(index)))
            count = count + 1;
        end

        index = index + 1;
        
    end
end

pr = count/t3;
fprintf('The empirical probability of success is: %.6f\n',pr);

