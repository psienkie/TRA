load("signal.mat");

% Parametry
N = length(signal); % Długość sygnału

% Wyliczanie autokorelacji
signal_resampled = resample(double(signal), 16, 21);
% signal_correlated = correlate_cp(signal_resampled, 8192, 0.125);

signal_correlated = correlate_cp(signal, 10752, 0.125);
% [signal_correlated epsilon] = LM_estimator(signal_resampled, 8192, 0.125, 0);
% Wyświetlenie autokorelacji z przesunięciem w próbkach
figure;
plot(abs(signal_correlated));
xlabel('Przesunięcie (lag) [próbki]');
ylabel('Amplituda');
title('Autokorelacja sygnału');
grid on;