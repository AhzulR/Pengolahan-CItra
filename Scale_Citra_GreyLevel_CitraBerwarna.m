clear;
I=imread('kelinci.jpeg');
figure(1), imshow(I);
[N,M,K]=size(I);
Sx=input('masukkan nilai skala horizontal: ');
Sy=input('masukkan nilai skala vertical: ');
S = [Sx 0 0; 0 Sy 0; 0 0 1];
Is(1:round(Sy*N),1:round(Sx*M),1:K)=0;
i=1;
for y=1:N
    j=1;
    for x=1:M
        v=[x; y; 1];
        V=round(S*v);
        for k=1:K
            Is(i:V(2,1),j:V(1,1),k)=I(y,x,k);
        end
        j=V(1,1)+1;
    end
    i=V(2,1)+1;
end
figure(2), imshow(uint8(Is));
IsM = imresize(I,0.5);
figure(3),imshow(uint8(IsM));
