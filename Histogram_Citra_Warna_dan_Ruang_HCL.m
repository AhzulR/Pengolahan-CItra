clear;
I = imread('CitraWarna.jpg');
figure(1), imshow(I);
[N,M,L]= size(I);
Hk = 12; Ck = 5; Lk = 5;
HCL_Histo(1:Hk, 1:Ck+1, 1:Lk)=0;
gamma = 10;
Q = exp(gamma/100.0);
Ldiv = round((2*Q-1.0)*255/(2.0*Lk));
Cdiv = round(2*255*Q/(3.0*Ck));
Hdiv = 30;
for n = 1:N
    for m = 1:M
        b = double(I(n,m,3));
        g = double(I(n,m,2));
        r = double(I(n,m,1));
        Max = max(r,min(g,b));
        Min = min(r,min(g,b));
        if Max == 0 
            Q = 1.0;
        else 
            Q = exp((Min*gamma)/(Max*100.0));
        end
        L = floor((Q*Max+(Q-1.0*Min)/(2.0*Ldiv)));
        rg = (r-g);
        gb = (g-b);
        C = (abs(b-r) + abs(rg) + abs(gb)) * Q/(3.0);
        if C <= 5 
            C = 0;
        else 
            C = 1 + floor((C-5)/Cdiv);
        end
        H = atan(gb/rg);
        if (C == 0)
            H = 0.0;
        elseif (rg >= 0 && gb >= 0)
            H = 2*H/3;
        elseif (rg>=0 && gb<0)
            H = 4*H/3;
        elseif (rg<0 && gb>=0)
            H = pi + 4*H/3;
        elseif (rg<0 && gb<0)
            H = 2*H/3 - pi;
        end
        H = H*(180/pi)+Hdiv/2;
        if H < 0 
            H = floor((360+H)/(Hdiv));
        else
            H = floor(H/(Hdiv));
        end
        HCL_Histo(H+1,C+1,L+1) = HCL_Histo(H+1, C+1, L+1)+1;
    end
end
HCL_Histo = (100*HCL_Histo/(N*M));
HCL_Histo(:,:,4)