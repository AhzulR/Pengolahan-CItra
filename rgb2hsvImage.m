function [H, S, V] = rgb2hsvImage(R,G,B)
if nargin == 1
    B = double(R(:,:,3));
    G = double(R(:,:,2));
    R = double(R(:,:,1));
end
[N,M] = size(R);
for n = 1:N
    for m = 1:M
        r = R(n,m);
        g = G(n,m);
        b = B(n,m);
        Max = max(r,max(g,b));
        Min = min(r,min(g,b));
        C = Max - Min;
        V(n,m) = Max;
        if (Max == Min)
            S(n,m) = 0;
        else
            S(n,m) = C;
        end
        if (Max == Min)
            H(n,m) = 0;
        elseif (r == Max)
            H(n,m) = ((g - b))/C;
        elseif (g == Max)
            H(n,m) = 2 + (b-r)/C;
        elseif (b == Max)
            H(n,m) = 4 + (r-g)/C;
        end
        H(n,m) = H(n,m)*pi/3;
    end
end
if nargout < 2
    H = cat(3,H,S,V);
end