function rpath = rotate_path(path,pos)
    if pos == 1
       rpath = path;
       return;
    end
    rpath = [path(1:pos),flip(path(pos+1:end))];
end