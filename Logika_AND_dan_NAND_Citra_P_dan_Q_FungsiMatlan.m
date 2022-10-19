clear;
P = imread('kelinci.jpeg');
P = im2bw(P,0.1);
figure(1), imshow(P,[]);
Q = imread('kelincibalik.jpeg');
Q = im2bw(Q,0.1);
figure(2), imshow(Q,[]);
[N, M] = size(P);
for n = 1 : M
    for m = 1 : M
        Citra_and(n,m)= bitand (P(n,m), Q(n,m));
        Citra_nand(n,m)= ~bitand (P(n,m) , Q(n,m));
    end
end
figure(3), imshow(Citra_and);
Citra_and1 =  bitand(P,Q);
figure(4), imshow(Citra_and1);
figure(5), imshow(Citra_nand);
Citra_nand1 = ~bitand(P,Q);
figure(6), imshow(Citra_nand1);
