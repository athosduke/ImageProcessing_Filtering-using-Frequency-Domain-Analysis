clear

f=imread('checker.gif');
[M, N] = size(f);
imtool(f,[ ]);

F   = fft2(double(f));
F(1,1) = 0.0;
g   = real(ifft2(F));
imtool(g);
imwrite(g,'g','tif');

sig = 15.0;
H   = lpfilter('gaussian', M, N, sig);
% Plot Scaled version of |H(u,v)|
imtool(log(1+H),[]);
% Make 3D plot of H(u,v)
mesh(H(1:5:256, 1:5:256));

for u = 1 : M
    for v = 1 : N
        G(u,v) = H(u,v)*F(u,v);
    end
end
g1   = real(ifft2(G));
imtool(g1,[ ]);


for x = 1:M
    for y = 1 : N
        g2(x,y)= g1(x,y)*((-1)^(x+y));
    end
end

G2 = log(1+fft2(double(g2)));
imtool(G2,[]);

% Part 2:  Do P x Q padded operations

 
P = 2 * M;
Q = 2 * N;
F   = fft2(double(f), P, Q);
sig = 15;
H   = lpfilter('gaussian', P, Q, 2*sig);
mesh(H(1:5:512, 1:5:512));
 
for u = 1 : P
    for v = 1 : Q
        G(u,v) = H(u,v)*F(u,v);
    end
end
g3  = real(ifft2(G));
imtool(g3,[]);
imwrite(g3,'1-c-g','tif');

for x = 1:M
    for y = 1 : N
        g3(x,y)= g3(x,y)*((-1)^(x+y));
    end
end
G3 = log(1+fft2(double(g3)));
imtool(G3,[]);



