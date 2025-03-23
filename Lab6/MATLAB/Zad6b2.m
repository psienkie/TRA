load("signal.mat");

% Parametry
N = length(signal); % Długość sygnału
fs_TX = 64e6/7;
scale = fs_TX/fs;

% Wyliczanie autokorelacji
signal_correlated = abs(xcorr(signal));

% Wyświetlenie autokorelacji z przesunięciem w próbkach
figure;
plot((-length(signal)+1:length(signal)-1)*scale, signal_correlated);
xlabel('Przesunięcie (lag) [próbki]');
ylabel('Amplituda');
title('Autokorelacja sygnału');
grid on;