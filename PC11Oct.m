clear;
Img = imread('kalkun1.jpeg');
figure (1), imshow(Img),
title('Tampilan Citra');
[N,M,K] = size(Img);
for i = N-5:N
    for j= M-5:M
        for k= 1:K
            Img(i,j,k)
        end
    end
end
Img(N-5:N,M-5:M,1)