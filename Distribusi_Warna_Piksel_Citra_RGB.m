clear all;
Img = imread('CitraWarna.jpg');
figure(1), imshow(Img);
figure(2), imshow(Img(:,:,1));
figure(3), imshow(Img(:,:,2));
figure(4), imshow(Img(:,:,3));
[N,M,L] = size(Img);
RGB_Citra(1:425,1:425,1:3) = 128;
sudut = -5*pi/6;
for n = 1:N
    for m = 1:M
        r = double(Img(n,m,1));
        g = double(Img(n,m,2));
        b = double(Img(n,m,3));
        j = 150 + floor(g+(b*sin(sudut)));
        i = 280 - floor(b*sin(sudut) + r);
        RGB_Citra(i,j,1)=r;
        RGB_Citra(i,j,2)=g;
        RGB_Citra(i,j,3)=b;
    end
end
figure(5), imshow(uint8(RGB_Citra));