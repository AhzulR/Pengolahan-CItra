clear all;
I=double(imread('Noisegray50%Gaussian.png'));
[N, M]=size (I);
alp = input ('Masukan nilai alpha: ');
bt = input ('Masukan nilai beta: ');
K1a= (1+(1+2*cos (alp*bt)) * (exp (-2*alp) -exp (-alp))-exp(-3*alp));
K1b= (1-cos (alp*bt)) * (exp (-alp) +exp (-2*alp)) + (((1-bt^2)/(2*bt)) *sin (alp*bt)) * (exp(- alp)-exp(-2*alp));
K1=K1a/K1b;
c0=K1*exp(-alp) * (1-cos (alp*bt) + (((1-bt^2)/(2*bt)) *sin(alp*bt)));
c1=K1*exp(-2*alp) * (1-cos (alp*bt) - (((1-bt^2)/(2*bt)) *sin (alp*bt)));
b1=-exp(-alp) * (1+2*cos (alp*bt));
b2=exp(-2*alp) * (1+2*cos (alp*bt));
b3=-exp(-3*alp);
K2=K1a/(0.5+ (1.5-2*cos (alp*bt)) * (exp (-alp) +exp(-2*alp) ) + sin (alp*bt) * (exp (-alp) -exp(-2 *alp))/bt+0.5*exp(-3*alp) );
a0=0.5*K2;
a1=K2*exp(-alp) * (0.5-1.5*cos (alp*bt) +0.5*sin (alp*bt)/bt);
a2=K2*exp(-2*alp) * (1-0.5*cos (alp*bt)-0.5*sin (alp*bt)/bt);
a3=K2*exp(-alp) * (1-0.5*cos (alp*bt) +0.5*sin (alp*bt) /bt);
a4=K2*exp(-2*alp)* (0.5-1.5*cos (alp*bt)-0.5*sin (alp*bt)/bt);
a5=0.5*K2*exp(-3*alp);
for i=1:N
    yp(i,1)=a0*I(i,1);
    yp(i,2)=a0*I(i,2)+ a1*I(i,1)-b1*yp(i,1);
    yp(i,3)=a0*I(i,3)+ a1*I(i,2)+ a2*I (i,1)-b1*yp(i,2)-b2*yp(i,1);
    yn(i,M)=0;
    yn(i,M-1)=a3*I(i,M);
    yn(i,M-2)=a3*I(i,M-1)+a4*I(i,M)-b1*yn(i,M-1);
    yn(i,M-3)=a3*I(i,M-2)+a4*I(i,M-1)+a5*I(i,M)-b1*yn(i,M-2)-b2*yn(i,M-1);
    for j=4:M-3
        yp (i,j)=a0*I(i,j)+a1*I(i,j-1)+a2*I (i, j-2)-b1*yp (i, j-1)-b2*yp (i, j-2)-b3*yp (i, j-3);
        yn (i,M-j)=a3*I(i,(M-j)+1)+ a4*I (i,(M-j)+2)+ a5*I (i, (M-j)+3) -b1*yn (i,(M-j)+1)- b2*yn (i, (M-j)+2)-b3*yn (i, (M-j)+3);
    end
    yp(i,M-2)=a0*I(i, M-2)+a1*I (i, M-3)+a2*I (i, M-4) -b1*yp (i, M-3)-b2*yp (i, M-4)-b3*yp (i, M-5);
    yp(i,M-1)=a0*I(i, M-1)+a1*I (i, M-2)+a2*I (i, M-3) -b1*yp (i, M-2)- b2*yp (i, M-3)-b3*yp (i, M-4);
    yp(i,M)=a0*I(i,M) +a1*I(i,M-1)+a2*I(i,M-2)-b1*yp(i,M-1)-b2*yp(i,M-2)-b3*yp(i,M-3);
end
for i=1:N
    for j=1:M
        Yx(i,j)=yp(i,j)+yn(i,j);
    end
end
for j=1:M
    yp (1,j)=a0*I(1,j);
    yp (2,j)=a0*I(2,j)+ a1*I (1,j)-b1*yp(1, j);
    yp (3,j)=a0*I(3,j)+ a1*I (2,j)+ a2*I(1,j)-b1*yp (2,j)-b2*yp (1, j);
    yn (N,j)=0;
    yn (N-1,j)=a3*I (N,j);
    yn (N-2,j)=a3*I (N-1,j)+a4*I (N,j)-b1*yn (N-1, j);
    yn (N-3,j)=a3*I (N-2,j)+a4*I (N-1,j)+a5*I(N,j)-b1*yn (N-2,j)-b2*yn (N-1, j);
    for i=4:N-3
        yp(i, j)=a0*I(i, j)+a1*I(i-1, j)+a2*I(i-2, j)-b1*yp(i-1, j)-b2*yp(i-2, j)-b3*yp(i-3,j);
        yn(N-i,j)=a3*I(N-i+1,j)+a4*I(N-i+2,j)+a5*I(N-i+3,j) - b1*yn(N-i+1,j)-b2*yn(N-i+2,j) - b3*yn(N-i+3,j);
    end
    yp(i,M-2)=a0*I (i, M-2)+a1*I (i, M-3)+a2*I (i, M-4)-b1*yp (i, M-3)-b2*yp (i, M-4)-b3*yp (i, M-5);
    yp(i,M-1)=a0*I (i, M-1)+a1*I (i, M-2)+a2*I (i, M-3)-b1*yp (i, M-2)-b2*yp (i, M-3)-b3*yp (i, M-5);
    yp(i,M) =a0*I(i,M) +a1 *I (i, M-1)+a2*I (i, M-2)-b1*yp (i, M-1)-b2*yp (i, M-2)-b3*yp (i,M-3);
end
for i=1:N
    for j=1:M
        Yy(i, j)=(yp(i,j)+ yn (i,j));
    end
end
for j=1:M
    yp (1,j)=0;
    yp (2,j)=c0*Yx (1,j);
    yp (3,j)=c0*Yx (2,j)+c1*Yx (1, j)-b1*yp (2,j);
    yn (N,j)=0;
    yn (N-1,j)=c0*Yx (N,j);
    yn (N-2,j)=c0*Yx (N-1, j)+c1*Yx (N,j)-b1*yn (N-1, j);
    yn (N-3,j)=c0*Yx (N-2, j)+c1*Yx (N-1,j)-b1*yn (N-2, j)-b2*yn (N-1, j);
    for i=4:N-3
        yp (i, j) =c0*Yx (i-1, j)+c1*Yx (i-2, j)-b1*yp (i-1, j)-b2*yp (i-2,j)-b3*yp (i-3,j);
        yn (N-i, j)=c0*Yx (N-i+1, j)+c1*Yx (N-i+2, j)- b1*yn (N-i+1, j)- b2*yn (N-i+2,j)- b3*yn (N-i+3,j);
    end
    yp (N-2, j)=c0*Yx (N-3, j)+c1*Yx (N-4, j)-b1*yp (N-3,j)-b2*yp (N-4, j)-b3*yp (N-5,j);
    yp (N-1, j)=c0*Yx (N-2, j)+c1*Yx (N-3, j)-b1*yp (N-2, j)-b2*yp (N-3, j)-b3*yp (N-4,j);
    yp (N,j)=c0*Yx (N-1, j)+c1*Yx (N-2,j)-b1*yp (N-1, j)-b2*yp (N-2,j)-b3*yp (N-3,j);
end
for i=1:N
    for j=1:M
        Yx (i, j)=abs (yp (i,j)- yn (i,j));
    end
end
for i=1:N
    yp (1,1)=0; yn (i,M)=0;
    yp (1,2)=c0*Yy (i, 1);
    yp (1,3)=c0*Yy (1, 2)+c1*Yy (i, 1)-b1*yp (1,2);
    yn (i, M-1)=c0*Yy(i,M);
    yn (i, M-2)=c0*Yy (i, M-1)+c1*Yy (i,M)-b1*yn (i, M-1);
    yn (i,M-3)=c0*Yy (i, M-2)+c1*Yy (i,M-1)-b1*yn (i, M-2)-b2*yn (i, M-1);
    for j=4:M-3
        yp (i, j)=c0*Yy(i,j-1)+c1*Yy (i, j-2)-b1*yp (i, j-1)-b2*yp (i, j-2)-b3*yp (i, j-3);
        yn(i,M-j)=c0*Yy(i,(M-j)+1)+c1*Yy(i,(M-j)+2)-b1*yn(i,(M-j)+1)-b2*yn(i,(M-j)+2)-b3*yn(i,(M-j)+3); 
    end
    yp (i, M-2)=c0*Yy (i, M-3)+c1*Yy (i, M-4)-b1*yp (i, M-3)-b2*yp (i, M-4)-b3*yp (i,M-5);
    yp (i, M-1)=c0*Yy (i, M-2)+c1*Yy (i, M-3)-b1*yp (i, M-2)-b2*yp (i, M-3)-b3*yp (i,M-4);
    yp (i,M)=c0*Yy (i, M-1)+c1*Yy(i, M-2)-b1*yp(i, M-1)-b2*yp(i,M-2)-b3*yp(i, M-3);
end
for i=1:N
    for j=1:M
        Yy (i, j)=abs (yp (i, j)-yn (i, j));
    end
end

for i=1:N
    for j=1:M
        Y(i,j)=Yx(i,j)+Yy (i, j);
    end
end
figure (1), imshow(uint8 (I));
figure (4), imshow (uint8 (Y));