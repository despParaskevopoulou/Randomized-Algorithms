function [sorted_arrays,N,avg_comp] = quick_sort_experiment(n, K)
    N = zeros(1,K);
   % sorted_arrays = cell(1, K);

    for i = 1:K
        sorted_arrays =  randperm(n); % Generate a random list
        [N(i),sorted_arrays] = quick_sort(sorted_arrays,length(sorted_arrays),1);
    end

   avg_comp = mean(N);
end

