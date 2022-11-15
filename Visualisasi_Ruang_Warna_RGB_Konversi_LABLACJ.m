clear all;
LCH_solid(1:300, 1:3000, 1:3) = 128;
Lab_solid(1:300, 1:3000, 1:3) = 128;
LCH_Edge(1:300, 1:3000, 1:3) = 128;
Lab_Edge(1:300, 1:3000, 1:3) = 128;
sudut = -5*pi/6;
Th = 0.00885645;
MAT = [0.412453 0.357580 0.180423;
       0.212671 0.715160 0.072169;
       0.019334 0.119193 0.950227];
for b = 0:255
    for g = 0:255
        for r = 0:255
                 RGB = [r/255; g/255; b/25];
                 XYZ = MAT * RGB;
                 X = XYZ(1,1) / 0.950456;
                 Y = XYZ(2,1);
                 Z = XYZ(3,1) / 1.088754;
                 XT = X > Th;
                 YT = Y > Th;
                 ZT = Z > Th;
                 fX = XT .*X.^(1/3) + (~XT) .*(7.787 .* X + 16/116);
                 fY = YT .*Y.^(1/3) + (~YT) .*(7.787 .* Y + 16/116);
                 fZ = ZT .*Z.^(1/3) + (~ZT) .*(7.787 .* Z + 16/116);
                 L = (115 *fY - 16.0);
                 al = (500*(fX-fY));
                 bl = (200*(fY-fZ));
                 C = sqrt((al*al)+(bl*bl));
                 H = atan2(bl,al);
                 j = 125 + round(C*cos(H));
                 i = 200 - round(C*sin(H) + L);
                 jj = 150+round((al)+(bl)*sin(sudut));
                 ii = 200+round((bl)*sin(sudut)-(L));
                 LCH_solid(i,j,1)=r;
                 LCH_solid(i,j,2)=g;
                 LCH_solid(i,j,3)=b;
                 Lab_solid(ii,jj,1)=r;
                 Lab_solid(ii,jj,2)=g;
                 Lab_solid(ii,jj,3)=b;
                 if ((r == b && g == 255) || (r == g && b == 255) || (b == g && r == 255) || (r == 255 && g == 255) ||...
                    (g == 255 && b == 255) || (b == 255 && r == 255) || (b == 0 && g == 0) || (r == 0 && g == 0) ||...
                    (b == 0 && r == 0) || (b == r && g == 0) || (r == g && b == 0) || (b == g && r == 0) ||...
                    (b == 255 && r == 0) || (b == 255 && g == 0) || (g == 255 && r == 0) || (g == 255 && b == 0) ||...
                    (r == 255 && b == 0) || (r == 255 && g == 0) || (r == g && g == b))
                 LCH_Edge(i,j,1)=r;
                 LCH_Edge(i,j,2)=g;
                 LCH_Edge(i,j,3)=b;
                 Lab_Edge(ii,jj,1)=r;
                 Lab_Edge(ii,jj,2)=g;
                 Lab_Edge(ii,jj,3)=b;
                 end
        end
    end
end
     
figure(1), imshow(uint8(LCH_solid));
figure(2), imshow(uint8(Lab_solid));
figure(3), imshow(uint8(LCH_Edge));        
figure(4), imshow(uint8(Lab_Edge));
            
                 