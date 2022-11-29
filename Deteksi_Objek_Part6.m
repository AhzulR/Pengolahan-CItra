clear all;
I = imread('Noisegray50%Gaussian.png');

s = input('Masukkan nilai standar deviasi : ');
A = (1/(2*pi*s^2));
C = (2*s^2); 
for i=1:7 
    for j=1:7 
        b(i,j) = A*exp(-((i-4)^2 + (j-4)^2)/C);
    end 
end
Iprim = conv2(double(I),b,'same'); 
figure(1), imshow(I);
figure(2), imshow(uint8(Iprim));