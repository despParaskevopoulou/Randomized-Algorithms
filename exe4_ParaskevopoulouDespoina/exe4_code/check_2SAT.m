function pos_sat_clause=check_2SAT(x,clauses,lit_clauses,K)
    pos_sat_clause = zeros(1,K);

    for i = 1:K
        t1 = clauses(i,1); t2 = clauses(i,2);

        if lit_clauses(i,1)==1
            if x(t1)==0
                pos_sat_clause(i) = 1;
            elseif lit_clauses(i,2)==1
                if x(t2)==0
                    pos_sat_clause(i) = 1;
                else
                    pos_sat_clause(i) = 0;
                end
            elseif lit_clauses(i,2) == 0
                if x(t2) == 1
                    pos_sat_clause(i) = 1;
                else
                    pos_sat_clause(i) = 0;
                end
            end

        elseif lit_clauses(i,1)==0
            if x(t1)==1
                pos_sat_clause(i) = 1;

            elseif x(t1)==0
                if lit_clauses(i,2) == 1
                    if x(t2) == 0
                        pos_sat_clause(i) = 1;
                    else 
                        pos_sat_clause(i) = 0;
                    end
                elseif lit_clauses(i,2) == 0
                    if x(t2) == 0
                        pos_sat_clause(i) = 0;
                    else
                        pos_sat_clause(i) = 1;
                    end
                end
            end
        end
    end
end