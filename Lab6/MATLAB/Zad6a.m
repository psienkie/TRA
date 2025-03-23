load("signal.mat");

% Parametry
N = length(signal); % Długość sygnału

% Obliczenie widma
S_fft = fft(signal, N);
S_fft_shifted = fftshift(S_fft);
f = (-N/2:N/2-1) * (fs/N);

% Wyświetlenie widma
figure;
plot(f, 20*log(abs(S_fft_shifted)));
xlabel('Częstotliwość [Hz]');
ylabel('Amplituda [dB]');
title('Widmo sygnału');
grid on;
