function pos_sat_clause = check_3SAT(x, clauses, lit_clauses, K)
    pos_sat_clause = zeros(K, 1);
    
    for i = 1:K
        var1 = clauses(i, 1); var2 = clauses(i, 2); var3 = clauses(i, 3);

        if x(var1)~=lit_clauses(i,1)
            pos_sat_clause(i) = 1;
        else
            if x(var2) ~= lit_clauses(i,2)
                pos_sat_clause(i) = 1;
            else
                if x(var3) ~= lit_clauses(i,3)
                    pos_sat_clause(i) = 1;
                end
            end
        end
    end
end
