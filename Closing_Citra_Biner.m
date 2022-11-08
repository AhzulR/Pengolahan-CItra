clear;
f = im2bw(imread('biner4.png'));
K =5;
B = ones(K,K);
figure(1), imshow(f);
[N,M] = size(f);
[I,J] = size(B);
I = floor(I/2);
J = floor(J/2);
for n = I + 1 : N-I
    for m  = J + 1 : M-J
        dilasi = 0;
        for i = -I:I
            for j = -J:J
                bit_dilasi = bitand(B(I+1+i,J+1+j), f(n+i,m+j));
                dilasi = bitor(dilasi, bit_dilasi);
            end
        end
        Citra_dilasi(n,m) = dilasi;
    end
end
[N,M] = size(Citra_dilasi);
for n = I + 1 : N-I
    for m  = J + 1 : M-J
        erosi = 1;
        for i = -I:I
            for j = -J:J
                bit_erosi = bitand(B(I+1+i,J+1+j), f(n+i,m+j));
                erosi = bitand(erosi, bit_erosi);
            end
        end
        Citra_closing(n,m) = erosi;
    end
end
figure(2), imshow((Citra_closing));
Citra_closing1 = imclose(f,B);
figure(3), imshow(Citra_closing1);