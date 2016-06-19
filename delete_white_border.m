function new_img = delete_white_border(img, same_size_img)
    
    new_img = same_size_img;
    compl = 255-img;
    ss = size(img);
    w = ss(1);
    h = ss(2);
    
    i=1;
    while(sum(compl(i)) == 0 && i+1 < ss(1))
        i = i+1;
    end
    if(i<ss(1))
        new_img = img(1:w, i+1:i+h);
    end
end