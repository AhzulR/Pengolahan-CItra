clear all;
I=double(imread('Noisegray50%Gaussian.png')); 
[N,M]=size(I);
alp = input( 'Masukan nilai alpha : '); 
K=(1-exp(-alp))^2/(1+2*alp*exp(-alp)-exp(-2*alp));
C=(1-exp (-alp) )^2/exp (-alp) ; a0=K;
a1=K*(alp-1)*exp(-alp); a2=K*(alp+1)*exp(-alp);
a3=-K*exp(-2*alp); b1=-2*exp (-alp);
b2=exp (-2*alp); c1=C*exp(-alp);

for i=1:N 
    yp(i,1)=a0*I(i,1); 
    yp(i,2)=a0*I(i,2)+ a1*I(i,1)-b1*yp(i,1); 
    yn(i,M)=0; 
    yn(i,M-1)=a2*I(i,M)-b1*yn(i,M); 
    yn(i,M-2)=a2*I(i,M-1)+a3*I(i,M)-b1*yn(i,M-1)-b2*yn(i,M); 
    for j=3:M-2 
        yp(i, j)=a0*I(i,j)+a1*I(i,j-1)-b1*yp(i, j-1)-b2*yp(i,j-2); 
        yn(i,M-j)=a2*I(i, (M-j)+1)+ a3*I(i, (M-j)+2)-b1*yn(i,(M-j)+1)-b2*yn(i,(M-j)+2);
    end 
    yp(i,M-1)=a0*I(i,M-1)+a1*I(i,M-2)- b1*yp(i,M-2)-b2*yp(i,M-3); 
    yp(i,M)=a0*I(i,M)+a1*I(i,M-1)-b1*yp(i,M-1)- b2*yp(i,M-2);
end
for i=1:N
    for j=1:M
        Yx(i,j) = yp(i,j)+yn(i,j);
    end
end
for j=1:M
    yp(1,j)=a0*I(1,j); 
    yp(2,j)=a0*I(2,j)+ a1*I(1,j)-b1*yp(1,j); 
    yn(N,j)=0; 
    yn(N-1,j)=a2*I(N,j)-b1*yn(N,j); 
    yn(N-2,j)=a2*I(N-1,j)+a3*I(N,j)-b1*yn(N-1,j)-b2*yn(N,j); 
    for i=3:N-2 
        yp(i,j)=a0*I(i,j)+a1*I(i-1,j)-b1*yp(i-1,j)-b2*yp(i-2,j); 
        yn(N-i,j)=a2*I(N-i+1,j)+ a3*I(N-i+2,j)-b1*yn(N-i+1,j)- b2*yn(N-i+2,j);
    end 
    yp(i,M-1)=a0*I(i,M-1)+a1*I(i,M-2)- b1*yp(i,M-2)-b2*yp(i,M-3); 
    yp(i,M)=a0*I(i,M)+a1*I(i,M-1)-b1*yp(i,M-1)-b2*yp(i,M-2);
end 
for i=1:N 
    for j=1:M
        Yy(i,j)=yp(i,j)+ yn(i,j); 
    end 
end
for	j=1:M 
    yp(1,j)=0; 
    yp(2,j)=c1*Yx(1,j); 
    yn(N, j) =0; 
    yn(N-1,j)=c1*Yx(N,j) ; 
    yn(N-2,j)=c1*Yx(N-1,j)-b1*yn(N-1,j)- b2*yn(N, j);
    for i=3:N-2
        yp(i, j)=c1*Yx(i-1,j)-b1*yp(i-1,j)-b2*yp(i-2,j); 
        yn(N-i, j)=c1*Yx(N-i+1, j) - b1*yn(N-i+1, j)- b2*yn(N-i+2, j);
    end 
    yp(N-1, j)=c1*Yx(N-2, j)-b1*yp(N-2, j)-b2*yp(N-3, j); 
    yp(N, j)=c1*Yx(N-1, j)-b1*yp(N-1, j)-b2*yp(N-2,j);
end
for i=1:N 
    for j=1:M
        Yx(i,j)=abs(yp(i,j) - yn(i,j)); 
    end 
end
for i=1:N 
    yp(i,1)=0; 
    yp(i,2)=c1*Yy(i,1); 
    yn(i,M)=0; 
    yn(i,M-1)=c1*Yy(i,M); 
    yn(i,M-2)=c1*Yy(i,M-1)-b1*yn(i,M-1);
    for j=3:M-2 
        yp(i, j)=c1*Yy(i, j-1)-b1*yp(i, j-1)-b2*yp(i,j-2); 
        yn(i,M-j)=c1*Yy(i, (M-j)+1)- b1*yn(i, (M-j)+1)-b2*yn(i, (M-j)+2); 
    end 
        yp(i,M-1)=c1*Yy(i,M-2)-b1*yp(i,M-2)-b2*yp(i,M-3); 
        yp(i,M)=c1*Yy(i,M-1)-b1*yp(i,M-1)-b2*yp(i,M-2);
end 
for i=1:N 
    for j=1:M
        Yy(i, j)=abs(yp(i, j)-yn(i, j)); 
    end
end
for i=1:N 
    for j=1:M
        Y(i,j)=Yx(i,j)+Yy(i,j); 
    end 
end
figure(1), imshow(uint8(I)); 
figure(2), imshow(uint8(Y));