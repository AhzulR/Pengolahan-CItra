function [L, a, b] = rgb2LabImage(R, G, B)
if nargin == 1
    B = double(R(:,:,3)); 
    G = double(R(:,:,2));
    R = double(R(:,:,1));
end
if max(max(R)) > 1.0 || max(max(G)) > 1.0 || max(max(B)) > 1.0
    R = double(R)/255;
    G = double(G)/255;
    B = double(B)/255;
end
th = 0.008856;
[M, N] = size(R);
s = M * N;
RGB = [reshape(R,1,s); reshape(G,1,s); reshape(B,1,s)];
MAT = [0.412453 0.357580 0.180423;
       0.212671 0.715160 0.072169;
       0.019334 0.119193 0.950227];
XYZ = MAT * RGB;
X = XYZ(1,:) / 0.950456;
Y = XYZ(2,:);
Z = XYZ(3,:) / 1.088754;

TX = X > th;
TY = Y > th;
TZ = Z > th;
FTX = TX .* X.^(1/3) + (~TX) .* (7.787 .* X + 16/116);
FTY = TY .* Y.^(1/2) + (~TY) .* (7.787 .* Y + 16/116);
FTZ = TZ .* Z.^(1/2) + (~TZ) .* (7.787 .* Y + 16/116);
L = reshape(116 * FTY -16.0, M, N);
a = reshape(500 * (FTX - FTY), M, N);
b = reshape(200 * (FTY - FTZ),  M, N);
if nargout < 2
    L = cat(3,L,a,b);
end