%% Zad6
clear variables
clc

%% parametry
M = [4 9 16];
A = [1; 1];
phi = [0; 0];
fs = 1;
jitt = 0.1;
q = 0.1;

for m=M
    fc = 0.1/m;
    f = fc * [0.9912331; 1.00323];
    N = 10000*m;
    
    x1 = gensinsum(A, phi, f, N, fs);
    x2 = gensinsumjitt(A, phi, f, N, jitt, fs);
    
    [b,a] = butter(5,(1/m)*fs/2);
    
    y1 = filter(b,a,x1);
    y2 = filter(b,a,x2);
    
    e = y1-y2;
    
    qeff = sqrt(12*cov(e));

    fprintf(['M: %.0f; ' ...
        'Kwant efektywny: %.8f\n'], ...
        m, qeff);
end
