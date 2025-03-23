%% Zad5
clear variables
clc

%% parametry
M = 16;
fs = 1;

%% rozwiazanie zadania
[b,a] = butter(5, (1/M)*fs/2);

[H, f] = freqz(b, a, 1024, fs);

figure;
subplot(2, 1, 1);
plot(f, abs(H));
title('Charakterystyka amplitudowa filtru Butterwortha');
xlabel('Częstotliwość (Hz)');
ylabel('Amplituda');
grid on;

subplot(2, 1, 2);
plot(f, angle(H));
title('Charakterystyka fazowa filtru Butterwortha');
xlabel('Częstotliwość (Hz)');
ylabel('Faza (radiany)');
grid on;
