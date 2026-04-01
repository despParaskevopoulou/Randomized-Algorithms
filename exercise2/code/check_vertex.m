function [exists,pos] = check_vertex(path,v)
    pos = find(path==v,1);

    if isempty(pos)
        exists = false;
        pos = -1;
    else
        exists = true;
    end
end
