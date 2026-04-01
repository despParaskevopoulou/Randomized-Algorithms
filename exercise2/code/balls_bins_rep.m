%% Balls and Bins
function max_loads = balls_bins_rep(n,K)
    B = zeros(1,K);
    max_loads = zeros(1,K);
    for i = 1:K
        bins = zeros(1,n);
        balls = zeros(1,n);
        ball_i = 0;

      
            ball = randi(n,1,n);

            for b = ball
                bins(b) = bins(b)+1;
                ball_i = ball_i + 1;
               
            end
           
        max_loads(i) = max(bins);
    end
end