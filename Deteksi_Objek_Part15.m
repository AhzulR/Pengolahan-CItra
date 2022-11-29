clear; 
I=double(imread('ImageEdgeGray.png')); 
B =[1 1 1; 1 1 1; 1 1 1]; 
Erosi=imerode(I,B); 
Dilasi=imdilate(I,B); 
Tepi_DID=abs(I- Dilasi); 
Tepi_DIE=abs(I-Erosi); 
Tepi_DDE=abs(Dilasi-Erosi); 
figure(1), imshow(uint8 (I)) ; 
figure(2), imshow(uint8 (Tepi_DID) ) ;
figure(3), imshow(uint8 (Tepi_DIE) ) ;
figure(4), imshow(uint8 (Tepi_DDE) ) ;