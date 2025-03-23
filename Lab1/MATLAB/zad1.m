%% Zad1
clear variables
clc

%% parametry
A = 1;
phi = 0;
f = 0.1;
N = 100;
fs = 2;

q = [0.01 0.1 1];

%% rozwiazanie zadania
x = gensinsum(A, phi, f, N, fs);
y1 = sample(x, N);

figure
hold on
plot(x) % rysowanie wykresu sygnalu x
scatter(1:N, y1) % nanoszenie na wykres punktow probkowania
hold off

figure
histogram(x, 100);

for i=1:length(q)
    e = x - quant(x, q(i)); % liczenie bledu kwantyzacji
    figure
    histogram(e, 100);
    title(['q = ' num2str(q(i))])
end