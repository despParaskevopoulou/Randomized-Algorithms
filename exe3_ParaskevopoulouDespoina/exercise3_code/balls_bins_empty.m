%% Balls and Bins
function empty_bins = balls_bins_empty(n,m,K)
    B = zeros(1,K);
    empty_bins = zeros(1,K); 

    for i = 1:K
        bins = zeros(1,n);
        ball_i = 0;

        for j=1:m
            b=randi(n);
            bins(b) = bins(b)+1;
            ball_i = ball_i + 1;
        end

        for bin=1:n
            if bins(bin) == 0
                empty_bins(i) = empty_bins(i) + 1;
            end
        end
    end
end