function mod_img = refine_img(img, mod_img_raw)
    h = min(size(img, 1), size(mod_img_raw, 1));
    w = min(size(img, 2), size(mod_img_raw, 2));
    mod_img = img;
    for i=1:h
        for j=1:w
            if(mod_img_raw(i,j,1) == 0.0 && mod_img_raw(i,j,2) == 0.0 && mod_img_raw(i,j,3) == 0.0)
                mod_img(i,j,:) = [0.0, 0.0, 0.0];
            elseif(mod_img_raw(i,j,1) == 1.0 && mod_img_raw(i,j,2) == 1.0 && mod_img_raw(i,j,3) == 1.0)
                mod_img(i,j,:) = [1.0, 1.0, 1.0];
                
            end
        end
    end
            
    
end