clear all;
I = double(imread('Noise50%Gaussian.png'));
[N,M] = size(I);
B = [1 1 1; 1 1 1; 1 1 1];
Open=imopen(I,B);
Close=imclose(Open,B);
figure(1), imshow(uint8(I));
figure(2), imshow(uint8(Close));