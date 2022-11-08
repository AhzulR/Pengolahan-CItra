clear;
f = im2bw(imread('biner3.bmp'));
B = [1 1 1; 1 1 1; 1 1 1];
figure(1), imshow(f);
[I,J] = size(B);
I = floor(I/2);
J = floor(J/2);
[N,M] = size(f);
for n = I + 1 : N-I
    for m  = J + 1 : M-J
        erosi = 255;
        for i = -I:I
            for j = -J:J
                erosi = max(B(I+1+i, J+1+i)*f(n+i,m+j),erosi);
            end
        end
        Citra_erosi(n,m) = erosi;
    end
end
figure(2), imshow((Citra_erosi));
Citra_erosi1 = imerode(f,B);
figure(3), imshow(Citra_erosi1);