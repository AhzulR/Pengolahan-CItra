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
        if(P(n,m) == 1 && Q(n,m) == 1)
            Citra_and(n,m)=1;
        else Citra_and(n,m)=0;
        end
        if(P(n,m) == 1 && Q(n,m) == 1)
            Citra_nand(n,m)=0;
        else Citra_nand(n,m)=1;
        end
    end
end
figure(3), imshow(Citra_and);
figure(4), imshow(Citra_nand);
