% Parametry sygnału
N = 1000;         
f0_norm = 0;      
f1_norm = 0.1;     
t = (0:N-1) / N;  

x1 = chirp(1:N, f0_norm, N, f1_norm, 'linear', 'complex');

% Wyświetlanie sygnału
figure;
plot(t, real(x1));
title('Sygnał chirp sinusoidalny o liniowo narastającej częstotliwości');
xlabel('Czas');
ylabel('Amplituda');

% Obliczanie widma sygnału
figure
plotspec(x1);
title('Widmo amplitudowe sygnału chirp (sin)');
xlabel('Unormowana częstotliwość');
ylabel('Amplituda [dB]');
