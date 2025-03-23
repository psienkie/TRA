%% Zad1
clear variables
clc

%% parametry
M = [4 9 16];
A = [0.1; 0.1];
phi = [0; 0];
fs = 1;
q = 0.1;

%% rozwiazanie zadania
for m=M
    fc = 0.1/m;
    f = fc * [0.9912331; 1.00323];
    N = 10000*m;

    % signal generation
    x = gensinsum(A, phi, f, N, fs);

    % noise generation
    [b_n, a_n] = butter(5, (2/m), 'high');
    d = filter(b_n, a_n, (A(1)*q*randn(size(x))));
    x_with_noise = x + d;
    
    [b,a] = butter(5, (1/m)*fs/2);
    
    y1 = filter(b, a, quant(x_with_noise, q));
    y2 = filter(b, a, x);
    
    e = y1 - y2;
    
    qeff = sqrt(12*cov(e));

    fprintf(['M = %.0f; Amplituda: A = %.2f; ' ...
        'Kwant efektywny: qeff = %.8f; Stosunek q/qeff = %.8f\n'], ...
        m, A(1), qeff, (q/qeff));
    
    figure
    plotspec(e, fs)
    title(sprintf('Widmo błędu kwantyzacji dla A = %.1f, M = %.0f', ...
        A(1), m));
end
