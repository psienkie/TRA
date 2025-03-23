clear all

% Parametry sygnału
N = 1000;         
f0_norm = 0;      
f1_norm = 0.1;     
repetitions = 5;
noise_amplitude = 1;

t = (0:repetitions*N-1) / N;

x1 = chirp(1:N, f0_norm, N, f1_norm, 'linear', 'complex');
noise = complex(randn(1, repetitions*N), randn(1, repetitions*N, 1));

% Filtr dopasowany
B = conj(x1(end:-1:1));
y = filter(B, 1, noise);

% Wyświetlanie wyjścia filtru dopasowanego
figure;
plot(t, real(y));
title('Wyjście filtru dopasowanego');
ylabel('Amplituda'); 
xlabel('Czas');
