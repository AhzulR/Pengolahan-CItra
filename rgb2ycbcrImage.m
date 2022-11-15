function [Y, Cb, Cr] = rgb2ycbcrImage(R,G,B)
if nargin == 1
    B = double(R(:,:,3));
    G = double(R(:,:,2));
    R = doule(R(:,:,1));
end
[N,M] = size(R);
for n = 1:N
    for m = 1:M
        r = R(n,m);
        g = G(n,m);
        b = B(n,m);
        Y(n,m) = 0.299*r + 0.587*g + 0.114*b;
        Cb(n,m) = 128 - 0.169*r - 0.331*g + 0.5*b;
        Cr(n,m) = 128 - 0.5*r - 0.419*g + 0.081*b;
    end
end
if nargout < 2
    Y = cat(3,Y,Cb,Cr);
end