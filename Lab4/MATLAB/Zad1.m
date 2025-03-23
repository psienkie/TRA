clear all

% Parametry sygnału
N = 1000;         
f0_norm = 0;      
f1_norm = 0.1;     
t = (0:N-1) / N;  

x1 = chirp(1:N, f0_norm, N, f1_norm);

% Wyświetlanie sygnału
figure;
plot(t, x1);
title('Sygnał chirp sinusoidalny o liniowo narastającej częstotliwości');
xlabel('Czas');
ylabel('Amplituda');

% Obliczanie widma sygnału
% z użyciem plotspec() - skala logarytmiczna
figure
plotspec(x1);
title('Widmo amplitudowe sygnału chirp (sin)');
xlabel('Unormowana częstotliwość');
ylabel('Amplituda [dB]');

% z użyciem fft() - skala liniowa
y1_fft = fft(x1);
frequencies = (-N/2:N/2 - 1) / N; 
figure       
plot(frequencies, abs(fftshift(y1_fft)));
title('Widmo amplitudowe sygnału chirp (sin)');
xlabel('Unormowana częstotliwość');
ylabel('Amplituda [lin]');
