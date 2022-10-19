clear;
P = double(imread('kelinci.jpeg'));
figure(1), imshow(uint8(P));
Q = double(imread('kelincibalik.jpeg'));
figure(2), imshow(uint8(Q));
[N, M, K] = size(P);
for n = 1 : N
    for m = 1 : M
        for k = 1 : K
            Citra_mul(n,m,k) = P(n,m,k) * Q(n,m,k);
        end
    end
end
if K==3 d = max(max(max(Citra_mul)));
    else d = max(max(Citra_mul));
end
Citra_mul = Citra_mul*255/d;
figure(3), imshow(uint8(Citra_mul));