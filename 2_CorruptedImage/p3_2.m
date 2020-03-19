f=imread('lake.tif');
f = f(:,:,1); 
[M, N] = size(f);
imtool(f,[]);
F=fft2(double(f));

for x = 1:M
    for y = 1 : N
        f1(x,y)= f(x,y)*((-1)^(x+y));
    end
end
F1=log(1+fft2(double(f1)));
imtool(F1,[]);

for x=1:M
    for y=1:N
        c(x,y)=f(x,y)+32*cos((2*pi*32*y)/N);
    end
end
%clip c
for x=1:M
    for y=1:N
        if c(x,y)<0
            c(x,y)=0;
            if c(c,y)>255
                c(x,y)=255;
            end
        end
    end
end
imtool(c);
C=fft2(double(c));

for x = 1:M
    for y = 1 : N
        c1(x,y)= c(x,y)*((-1)^(x+y));
    end
end
C1=log(1+fft2(double(c1)));
imtool(C1,[]);


%design the notch filter
for u=1:M
    for v=1:N
        if v == 33 || v==481
            H(u,v) = 0;
        else
            H(u,v) = 1;
          
        end
    end
end
imtool(H,[]);

%filter the noised image
for u=1:M
    for v=1:N
        G(u,v)=C(u,v)*H(u,v);
    end
end

g=real(ifft2(G));
imtool(g,[]);

for x = 1:M
    for y = 1 : N
        g1(x,y)= g(x,y)*((-1)^(x+y));
    end
end
G1=log(1+fft2(double(g1)));
imtool(G1,[]);

%give value of f(x,y)-g(x,y)
for x=1:M
    for y=1:N
        z(x,y)=f(x,y)-g(x,y);
    end
end
imtool(z);

for x = 1:M
    for y = 1 : N
        z(x,y)= z(x,y)*((-1)^(x+y));
    end
end
Z = log(1+fft2(double(z)));
imtool(Z,[ ]);

