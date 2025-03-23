%% Zad4 - test sigmy-delty
clear variables
clc

%% parametry
A = 1;
phi = 0;
f = 0.01;
N = 1000;
fs = 2;

%% rozwiązanie zadania
x = gensinsum(A, phi, f, N, fs);
sigmadelta2_out = sigmadelta2(x);

figure
hold on
plot(1:length(x), x);
stairs(1:length(x), sigmadelta2_out);
hold off
