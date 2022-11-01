clear;
I=imread('kelinci.jpeg');
figure(1), imshow(I);
IrM = imresize(I,0.5);
figure(2),imshow(uint8(IrM));
