clear;
I = imread('kelinci.jpeg');
figure(1), imshow(I);
[N,M,L] = size(I);
x0 = input('masukkan nilai translasi x0 : ');
y0 = input('masukkan nilai translasi y0 : ');
It(1:N+y0, 1:M+x0,1:L)=127;
T = [1 0 x0; 0 1 y0; 0 0 1];
for y = 1:N
    for x = 1:M
        v = [x; y; 1];
        V = T*v;
        It(V(2,1),V(1,1),1:L) = I (y,x,1:L);
    end
end
figure(2), imshow(uint8(It));