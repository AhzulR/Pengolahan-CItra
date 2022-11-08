clear;
I = imread('image5_gray.png');
figure(1), imshow(I);
Histo = imhist(I);
figure(2), plot(Histo);
[N,M] = size(I);
[L] = size(Histo);
Hist_kum(1) = Histo(1);
   for l = 2 : L
       Hist_kum(l) = Histo(l) + Hist_kum(l-1);
   end
Hist_kum = Hist_kum/(N*M);
figure(3), plot(Hist_kum);