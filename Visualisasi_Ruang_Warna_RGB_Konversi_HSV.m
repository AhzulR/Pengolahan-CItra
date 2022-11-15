clear all;
HSV_solid(1:325, 1:350,1:3)=128;
HSV_Edge(1:325, 1:350,1:3)=128;
for b = 0:255
    for g = 0:255
        for r = 0:255
            Max = max(r,max(g,b));
            Min = min(r,min(g,b));
            C = Max - Min;
            V = Max;
            if (Max == Min)
                S = 0;
            else 
                S = C;
            end
            if (Max == Min)
                H = 0;
            elseif (r == Max) 
                H = ((g-b))/C;
            elseif (g == Max)
                H = 2 + (b-r)/C;
            else
                H = 4 + (r-g)/C;
            end
            H = H * pi/3;
            j = 285 + floor(S*cos(H));
            i = 350 - floor(S*sin(H)/4.0 + V);
            HSV_solid(i,j,1)=r;
            HSV_solid(i,j,2)=g;
            HSV_solid(i,j,3)=b;
            
            if ((r == b && g == 255) || (r == g && b == 255) || (b == g && r == 255) || (r == 255 && g == 255) ||...
               (g == 255 && b == 255) || (b == 255 && r == 255) || (b == 0 && g == 0) || (r == 0 && g == 0) ||...
               (b == 0 && r == 0) || (b == r && g == 0) || (r == g && b == 0) || (b == g && r == 0) ||...
               (b == 255 && r == 0) || (b == 255 && g == 0) || (g == 255 && r == 0) || (g == 255 && b == 0) ||...
               (r == 255 && b == 0) || (r == 255 && g == 0) || (r == g && g == b))
               HSV_Edge(i,j,1)=r;
               HSV_Edge(i,j,2)=g;
               HSV_Edge(i,j,3)=b;
            end
        end
    end
end
figure(1), imshow(uint8(HSV_solid));
figure(2), imshow(uint8(HSV_Edge));
            