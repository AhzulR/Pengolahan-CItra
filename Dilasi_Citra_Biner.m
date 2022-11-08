clear;
f = im2bw(imread('biner3.bmp'));
B = [1 1 1; 1 1 1; 1 1 1];
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
figure(2), imshow((Citra_dilasi));
Citra_dilasi1 = imdilate(f,B);
figure(3), imshow(Citra_dilasi1);