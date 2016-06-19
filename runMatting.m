clear;clc;

img_name_without_type = 'kid1';
type = 'bmp';
img_name = strcat(img_name_without_type, strcat('.', type));
mod_img_name = strcat(img_name_without_type, strcat('_m.', type));

img=im2double(imread(img_name));
get_pencil_curve(1,img, mod_img_name);
mod_img_raw=im2double(imread(mod_img_name));

%mod_img = imresize(mod_img, [size(img, 1) size(img, 2)]);

figure, imshow(mod_img_raw);
mod_img = refine_img(img, mod_img_raw);

fg_and_bg=sum(abs(img-mod_img),3)>0.001;
fg=rgb2gray(mod_img).*fg_and_bg;

figure, imshow([fg_and_bg, fg]);

if(1) 
    alpha = generateAlpha(img,fg_and_bg,fg);
    beta = 1-alpha;
    figure, imshow([alpha, beta]);
end

if(1) 
    foreground = img.*repmat(alpha,[1,1,3]);
    background = img.*repmat(beta,[1,1,3]);
    figure, imshow([foreground,background]);
end

