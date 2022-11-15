clear all;
RGB_solid(1:425, 1:425, 1:3)=128;
RGB_Edge(1:425, 1:425, 1:3)=128;
Imax = 255;
sudut = -5*pi/6;
for b=0: Imax
    for g=0: Imax
        for r=0: Imax
            j = 150 + floor(g+(b*sin(sudut)));
            i = 280 + floor(b*sin(sudut) + r);
            RGB_solid(i,j,1)=r;
            RGB_solid(i,j,2)=g;
            RGB_solid(i,j,3)=b;
            
            if ((r == b && g == Imax) || (r == g && b == Imax) || (b == g && r == Imax) || (r == Imax && g == Imax) ||...
               (g == Imax && b == Imax) || (b == Imax && r == Imax) || (b == 0 && g == 0) || (r == 0 && g == 0) ||...
               (b == 0 && r == 0) || (b == r && g == 0) || (r == g && b == 0) || (b == g && r == 0) ||...
               (b == Imax && r == 0) || (b == Imax && g == 0) || (g == Imax && r == 0) || (g == Imax && b == 0) ||...
               (r == Imax && b == 0) || (r == Imax && g == 0) || (r == g && g == b))
               RGB_Edge(i,j,1)=r;
               RGB_Edge(i,j,2)=g;
               RGB_Edge(i,j,3)=b;
            end
        end
    end
end
figure(1), imshow(uint8(RGB_solid));
figure(2), imshow(uint8(RGB_Edge));
        