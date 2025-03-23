clear all;
load("signal.mat");

signal = double(signal);

% Przepróbkowanie sygnału (dostosowanie do fs_TX)
signal_resampled = resample(signal, 16, 21);
N = length(signal_resampled);

% Wyliczanie autokorelacji
signal_correlated = abs(xcorr(signal_resampled));

% Wyświetlenie autokorelacji z przesunięciem w próbkach
figure;
plot(-N+1:N-1, signal_correlated);
xlabel('Przesunięcie (lag) [próbki]');
ylabel('Amplituda');
title('Autokorelacja sygnału');
grid on;
