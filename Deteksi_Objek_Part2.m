clear;
Im = double(imread('ImageEdgeGray.png'));
figure(1), imshow(uint8(Im));
[N,M] = size(Im);

for n=1:N-1
    for m=1:M-1
        Gy(n,m)=abs (Im(n+1,m+1)-Im(n,m) ) ; 
        Gx(n,m)=abs (Im(n,m+1)-Im(n+1,m) ) ;
        G(n,m) =sqrt(Gx(n,m)^2 + Gy(n,m)^2);
    end
end
figure (2) , imshow (uint8 (Gx) ) ; 
GR = imgradient(Im,'roberts');
figure(3), imshow(uint8(GR*255));