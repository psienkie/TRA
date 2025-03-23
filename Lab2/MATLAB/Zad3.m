%% Zad5
clear variables
clc

%% parametry
M = [4 9 16];
A = [1; 1];
phi = [0; 0];
fs = 1;
q = 0.1;

%% rozwiazanie zadania
for m=M
    fc = 0.1/m;
    f = fc * [0.9912331; 1.00323];
    N = 10000*m;
   
    x = gensinsum(A, phi, f, N, fs);
    
    [b,a] = butter(5, (1/m)*fs/2);

    sigmadelta_out = sigmadelta(x);
    
    y1 = filter(b, a, sigmadelta_out);
    y2 = filter(b, a, x);
    
    e = y1 - y2;
    
    qeff = sqrt(12*cov(e));

    fprintf(['M = %.0f; Amplituda: A = %.1f; ' ...
        'Kwant efektywny: qeff = %.8f; Stosunek q/qeff = %.8f\n'], ...
        m, A(1), qeff, (q/qeff));

end