load("iio_535M_56M_1848.mat ");
I = cf_ad9361_lpc_voltage0;
Q = cf_ad9361_lpc_voltage1;

S = I + 1j * Q ;
% Parametry
fs = 56e6 ; % Czestotliwosc probkowania
N = length(S); % Dlugosc sygnalu

% Obliczenie widma
S_fft = fft(S, N);
S_fft_shifted = fftshift(S_fft);
f = (-N/2: N/2 - 1) * (fs/N);

% Wyswietlenie widma
figure;
plot(f, 20* log(abs(S_fft_shifted)));
xlabel('Czestotliwosc [ Hz ]');
ylabel('Amplituda [ dB ]');
title('Widmo sygnalu');
grid on ;