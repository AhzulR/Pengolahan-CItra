clear;
K = 3;
F = ones(K,K)/(K*K);
K1 = (K+1)/2;
I = [164 63 75 95 157
     120 135 55 75 116
     99 132 60 54 100
     64 150 113 50 81
     110 130 162 60 76];
 
[N,M]=size(I);
Citra = zeros(N+K-1, M+K-1);
Citra(K1:N+K1-1, K1:M+K1-1)=I(:,:)
for n = K1 : N+K1-1
    for m = K1 : M+K1-1
        konv = 0;
        for l = 1 : K
            for k = 1 : K
            konv = konv + (F(l,k) * Citra(n+1-K1,m+k-K1));
            end
        end
        Citra_konv(n-K1+1,m-K1+1) = konv;
    end
end
Citra_konv
Citra_konv1=conv2(I,F,"same");