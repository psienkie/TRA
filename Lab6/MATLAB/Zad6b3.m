clear all;
load("signal.mat");

signal = double(signal);

N = length(signal);

% Wyliczanie autokorelacji
signal_correlated = abs(xcorr(signal));

% Wyświetlenie autokorelacji z przesunięciem w próbkach
figure;
plot(-N+1:N-1, signal_correlated);
xlabel('Przesunięcie (lag) [próbki]');
ylabel('Amplituda');
title('Autokorelacja sygnału');
grid on;
