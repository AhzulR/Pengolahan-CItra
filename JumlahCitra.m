clear;
P = imread('kalkun1.jpeg');
figure(1), imshow(P);
Q = imread('kalkun2.jpeg');
figure(2), imshow(Q);
a = 0.5; b = 1 - a;
[N, M, K] = size(P);
[N1, M1, K1] = size(Q);
N = min(N,N1); M = min(M,M1); K = min(K, K1);
for n = 1 : N
    for m = 1 : M
        for k = 1 : K
            Citra_sum(n,m,k) = a*P(n,m,k) + b*Q(n,m,k);
        end
    end
end
figure(3), imshow(Citra_sum);
Citra_sum1 = a*P(1:N,1:M) + b*Q(1:N,1:M);
figure(4), imshow(Citra_sum1);