load("iio_535M_56M_1848.mat");
I = cf_ad9361_lpc_voltage0;
Q = cf_ad9361_lpc_voltage1;

S = I + 1j * Q;

% Parametry
fs = 56e6; % Częstotliwość próbkowania 
N = length(S); % Długość sygnału

% Parametry filtra
f_cutoff = 4e6; % Częstotliwość graniczna filtru 
f_norm = f_cutoff / (fs/2); % Normalizacja

decimation = 7;

% Przemodulowanie sygnału
Y = S'.*exp(-1j*2*pi*262204/N*(0:N-1));

% Filtrowanie
b = fir1(200, f_norm);
Y_filtered = filter(b, 1, Y);

% Decymacja
Y_decimated = decimate(double(Y_filtered), decimation);

% Autokorelacja
Y_correlated = abs(xcorr(Y_decimated));

% WYznaczanie początków symboli
[theta, epsilon] = LM_estimator(Y_decimated, 7168, 0.125, 1);

% Wyświetlenie wykresu momentów detekcji początków ramki
figure;
plot(theta);
xlabel('Numer próbki');
ylabel('Amplituda');
title('Momenty wykrycia początków ramek');
grid on;