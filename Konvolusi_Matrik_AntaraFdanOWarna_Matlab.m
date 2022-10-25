clear;
K = 3;
F = ones(K,K)/(K*K);
I = imread('kelinci.jpeg');
figure(1), imshow(I);
[N,M,L]=size(I);
for p = 1 : L
    Konv(1:N,1:M,p)=conv2(double(I(:,:,p)),F,'same');
end
figure(2), imshow(uint8(Konv));