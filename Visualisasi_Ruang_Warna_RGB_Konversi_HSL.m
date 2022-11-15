clear all;
HSL_solid(1:325, 1:350,1:3)=128;
HSL_Edge(1:325, 1:350,1:3)=128;
for b = 0:255
    for g = 0:255
        for r = 0:255
            Max = max(r,max(g,b));
            Min = min(r,min(g,b));
            C = Max - Min;
            L = (Max+Min)/2.0;
            if (Max == Min)
                S = 0;
            elseif (L>=127)
                S = (C)/(2*L/255);
            elseif (L<127)
                S = (C)/((2-(2*L/255)));
            end
            if (C==0)
                H = 0;
            elseif (r == Max) 
                H = ((g-b))/C;
            elseif (g == Max)
                H = 2 + (b-r)/C;
            elseif (b == Max)
                H = 4 + (r-g)/C;
            end
            H = H * pi/3;
            j = 175 + floor((S/2)*cos(H));
            i = 285 - floor((S/2)*sin(H)/8.0 + L);
            HSL_solid(i,j,1)=r;
            HSL_solid(i,j,2)=g;
            HSL_solid(i,j,3)=b;
            
            if ((r == b && g == 255) || (r == g && b == 255) || (b == g && r == 255) || (r == 255 && g == 255) ||...
               (g == 255 && b == 255) || (b == 255 && r == 255) || (b == 0 && g == 0) || (r == 0 && g == 0) ||...
               (b == 0 && r == 0) || (b == r && g == 0) || (r == g && b == 0) || (b == g && r == 0) ||...
               (b == 255 && r == 0) || (b == 255 && g == 0) || (g == 255 && r == 0) || (g == 255 && b == 0) ||...
               (r == 255 && b == 0) || (r == 255 && g == 0) || (r == g && g == b))
               HSL_Edge(i,j,1)=r;
               HSL_Edge(i,j,2)=g;
               HSL_Edge(i,j,3)=b;
            end
        end
    end
end
figure(1), imshow(uint8(HSL_solid));
figure(2), imshow(uint8(HSL_Edge));
            