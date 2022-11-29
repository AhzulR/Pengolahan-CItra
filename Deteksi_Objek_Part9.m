clear all;
I = imread('Noisegray50%Gaussian.png');

s1 = input('Masukkan nilai standar deviasi : ');
s2 = input('Masukkan nilai standar deviasi : ');
A1 = -(1/(2*pi*s1^2));
A2 = -(1/(2*pi*s2^2));
C1 = (2*s1^2); 
C2 = (2*s2^2); 
for i=1:11 
    for j=1:11
        G1(i,j) = A1*exp(-( (i-5) ^2 + (j-5) ^2) /C1) ; 
        G2(i,j) = A2*exp(-( (i-5) ^2 + (j-5) ^2) /C2) ;
    end 
end
Idog1 = conv2(I, G1, 'same'); 
Idog2 = conv2(I, G2, 'same'); 
Idog = abs(Idog1 - Idog2); 
figure(1), imshow(uint8(I)); 
figure(2), imshow(uint8(Idog));