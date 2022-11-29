clear ;
I=double(imread('Noisegray50%Gaussian.png')) ; 
[N,M]=size(I);

alp = input ( 'Masukan nilai alpha : ') ; 
b1=-exp (-alp) ; 
a1=(1+b1)/(1-b1); 
c1= (1+b1) ; 
for i=1:N
    yp(i,1)=a1*I(i,1); 
    yn(i,M)=a1*I(i,1); 
    yn(i,M-1)=a1*I(i,M-1)-b1*yn(i,M);
  for j=2:M-1 
    yp(i, j)=a1*I(i,j)-b1*yp(i,j-1);
    yn(i,M-j)=a1*I(i,(M-j)+1)-b1*yn(i, (M-j)+1); 
  end 
    yp(i,M)=a1*I(i,M)-b1*yp(i,M-1);
end 
for i=1:N 
    for j=1:M
        Yx(i,j)=yp(i,j)+yn(i,j); 
    end 
end 
for j=1:M
    yp(1,j)=a1*I(1,j); 
    yn(N,j)=a1*I(N,j); 
    yn(N-1,j)=a1*I(N-1,j)-b1*yn(N,j);
  for i=2:N-1 
    yp(i,j)=a1*I(i,j)-b1*yp(i-1, j); 
    yn(N-i, j)=a1*I((N-i)+1, j)-b1*yn((N-i)+1,j);
  end 
    yp(N,j)=a1*I(N,j)-b1*yp(N-1,j);
end
for i=1:N 
    for j=1:M
        Yy(i, j)=abs (yp(i, 1)+ yn(i, i)) ; 
    end 
end
for j=1:M 
    yp(1,j)=c1*Yx(1,j); 
    yn(N,j)=-c1*Yx(N,j); 
    yn(N-1,j)=-c1*Yx(N-1,j)-b1*yn(N,j);
  for i=2:N-1 
    yp(i,j)=c1*Yx(i-1,j)-b1*yp(i-1,j); 
    yn(N-i,j)=-c1*Yx((N-i)+1,j)-b1*yn((N-i)+1,j);
  end 
    yp(N, j)=c1*Yx(N, j)-b1*yp(N-1, j);
end 
for i=1:N 
    for j=1:M
        Yx(i, j)=abs (yp(i,j) + yn (i,j)) ; 
    end 
end

for i=1:N
    yp(i,1)=c1*Yy(i,1); 
    yn(i,M)=-c1*Yy(i,M); 
    yn(i,M-1)=-c1*Yy(i,M-1)-b1*yn(i,M);
  for j=2:M-1 
    yp(i,j)=c1*Yy(i,j-1)-b1*yp(i,j-1); 
    yn (i, M- j) =-c1*Yy (i,(M-j ) +1) -b1*yn (i,(M-j) +1) ;
  end 
    yp(i,M)=c1*Yy(i,M)-b1*yp(i,M-1);
end 
for i=1:N 
    for j=1:M
        Yy(i,j)=abs(yp(i,j)+yn(i,j)); 
    end 
end
for i=1:N 
    for j=1:M
        Y(i,j)=Yx(i,j)+Yy(i,j); 
    end 
end
figure(1), imshow(uint8(I)); 
figure(2), imshow(uint8(Y));