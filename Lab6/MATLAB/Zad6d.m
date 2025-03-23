load("signal.mat");

symbol_length = 10752; % Rozmiar symbolu
N = 8192; % Liczba punktów nośnych w transformacie

% Wyznaczenie widma OFDM
symbol_FD = OFDM_transform(signal, symbol_length, N);