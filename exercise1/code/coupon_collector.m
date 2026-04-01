%% Randomized Algorithms 1st Exercise
%% Coupon Collector
function N = coupon_collector(n,K)
    N = zeros(1,K);
    for k=1:K
        collectedCoupons = zeros(1, n);
        total = 0;
        numCollected=0;

        while numCollected < n 
            coupon = randi(n);
            total = total+1;

            if (collectedCoupons(coupon) == 0)
                collectedCoupons(coupon) = 1;
                numCollected = numCollected+1;
            end
        end

        N(k) = total;
    end
end