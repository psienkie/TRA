%% lab0
% poniższy skrypt ma na celu zaznajomienie studentów z funkcjami które będą
% wykorzystywali na laboratorium 1 i 2.

clear variables
clc

%% parametry
A = [1; 0.5; 0.25]/2;
phi = [ 0; 0; 0];
f = [1; 2; 3];
N = 1001;
fs = 100;
jitt = 0.001;

%% generowanie sygnałów
x = gensinsum(A, phi, f, N, fs);
% x = gensinsumjitt(A, phi, f, N, jitt, fs);

y1 = sample(x, 5);

y2 = quant(x, .1);

%% wyświetlanie wyników1
figure(1); clf;
plot(x);

figure(2); clf;
plotspec(x, fs);

figure(3); clf;
plot(y1);

figure(4); clf;
plotspec(y1);

figure(5); clf;
plot(y2);

figure(6); clf;
plotspec(y2);
