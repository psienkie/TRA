%% Zad4
clear variables
clc

%% parametry
A = [1; 1];
phi = [0; 0];
fc = 0.0001;
f = fc * [0.9912331; 1.00323];
N = 10000;
fs = 2;

q = [0.0001 0.01 0.1 1];

%% rozwiązanie zadania
x = gensinsum(A, phi, f, N, fs);

figure
histogram(x, 100);

figure;
pspectrum(x, fs, 'power');

for i=1:length(q)
    e = x - quant(x, q(i));
    figure
    histogram(e,100);
    title(['q = ' num2str(q(i))])

    figure;
    pspectrum(e, fs, 'power');
    title(['q = ' num2str(q(i))])

    cov_e = cov(e);  % kowariancja bledu kwantyzacji
    theoretical_variance = q(i)^2/12;  % teoretyczna wariancja kwantyzacji

    % wyswietlanie wynikow
    fprintf(['Kowariancja bledu kwantyzacji: %.8f; ' ...
        'Wariancja q^2/12: %.8f\n'], ...
        cov_e, theoretical_variance);
end