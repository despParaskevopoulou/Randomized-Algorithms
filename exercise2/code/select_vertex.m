function v = select_vertex(list)
    n = length(list);
    unused_counts = zeros(1,n);

    for i=1:n
        unused_counts(i) = length(list{i});
    end

    total = sum(unused_counts);
    if total == 0
        error('No unused edges remaining to select from.');
    end

    prob = unused_counts/total;
    r = rand;
    v = find(r < cumsum(prob),1);
end