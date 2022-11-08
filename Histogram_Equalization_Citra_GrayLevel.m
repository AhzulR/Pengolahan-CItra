clear;
I = imread('image5_gray.png');
figure(1), imshow(I);
Histo = imhist(I);
[N,M] = size(I);
[L] = size(Histo);
Hist_kum(1) = Histo(1);
   for l = 2 : L
       Hist_kum(l) = Histo(l) + Hist_kum(l-1);
   end
Hist_kum = Hist_kum/(N*M);
for n = 1 : N
    for m = 1 : M
        Im_equal(n,m) = round(Hist_kum(I(n,m)+1) * 255);
    end
end
figure(2), imshow(uint8(Im_equal));
I_equal = histeq(I);
figure(3), imshow(I_equal);