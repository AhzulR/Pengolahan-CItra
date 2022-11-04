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
        if(P(n,m) == Q(n,m))
            Citra_xor(n,m)=0;
        else Citra_xor(n,m)=1;
        end
        if(P(n,m) == Q(n,m))
            Citra_xnor(n,m)=1;
        else Citra_xnor(n,m)=0;
        end
    end
end
figure(3), imshow(Citra_xor);
figure(4), imshow(Citra_xnor);
