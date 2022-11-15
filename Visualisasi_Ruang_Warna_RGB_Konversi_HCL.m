clear all;
HCL_solid(1:325, 1:350,1:3)=128;
HCL_Edge(1:325, 1:350,1:3)=128;
gamma = 10;
for b = 0:255
    for g = 0:255
        for r = 0:255
            Max = max(r,max(g,b));
            Min = min(r,min(g,b));
            if Max ==0
                Q = 1.0;
            else
                Q=exp((Min*gamma)/(Max*100.0));
            end
            L = (Q*Max+(Q-1.0)*Min)/2.0;
            rg = (r-g);
            gb = (g-b);
            C = (abs(b-r)+abs(rg)+abs(gb))*Q/(3.0);
            H = atan(gb/rg);
            if (C==0)
                H = 0.0;
            elseif (rg>=0 && gb>=0)
                H = 2*H/3;
            elseif ((rg>=0) && gb<0)
                H = 4*H/3;
            elseif (rg<0 && gb>=0)
                H = pi + 4*H/3;
            elseif (rg<0 && gb<0)
                H = 2*H/3 - pi;
            end
            j = 200 + round(C*cos(H));
            i = 250 - round(C*sin(H)/4.0 + L);
            HCL_solid(i,j,1)=r;
            HCL_solid(i,j,2)=g;
            HCL_solid(i,j,3)=b;
            
            if ((r == b && g == 255) || (r == g && b == 255) || (b == g && r == 255) || (r == 255 && g == 255) ||...
               (g == 255 && b == 255) || (b == 255 && r == 255) || (b == 0 && g == 0) || (r == 0 && g == 0) ||...
               (b == 0 && r == 0) || (b == r && g == 0) || (r == g && b == 0) || (b == g && r == 0) ||...
               (b == 255 && r == 0) || (b == 255 && g == 0) || (g == 255 && r == 0) || (g == 255 && b == 0) ||...
               (r == 255 && b == 0) || (r == 255 && g == 0) || (r == g && g == b))
               HCL_Edge(i,j,1)=r;
               HCL_Edge(i,j,2)=g;
               HCL_Edge(i,j,3)=b;
            end
        end
    end
end
figure(1), imshow(uint8(HCL_solid));
figure(2), imshow(uint8(HCL_Edge));
            