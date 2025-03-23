load("iio_535M_56M_1848.mat");
I = cf_ad9361_lpc_voltage0;
Q = cf_ad9361_lpc_voltage1;

S = I + 1j * Q;

% Parametry
fs = 56e6; % Częstotliwość próbkowania 
N = length(S); % Długość sygnału

% Przemodulowanie sygnału
Y = S'.*exp(-1j*2*pi*262204/N*(0:N-1));

% Obliczenie widma
Y_fft = fft(Y, N);
Y_fft_shifted = fftshift(Y_fft);
f = (-N/2:N/2-1) * (fs/N);

% Wyświetlenie widma
figure;
plot(f, 20*log(abs(Y_fft_shifted)));
xlabel('Częstotliwość [Hz]');
ylabel('Amplituda [dB]');
title('Widmo sygnału');
grid on;