function symbol_FD = OFDM_transform(symbol_TD, symbol_length, N)
    % Parametry CZT
    A = exp(-1j*pi*N/symbol_length);
    W = exp(-1j*2*pi/symbol_length); 

    % Wyświetlenie punktów na płaszczyźnie Z
    figure;
    Z_points = A * W.^(-(0:N));
    plot(real(Z_points), imag(Z_points), '*');
    xlabel('Re(Z)');
    ylabel('Im(Z)');
    title('Punkty na płaszczyźnie zespolonej (CZT)');
    grid on;

    % Transformacja CZT (OFDM)
    symbol_FD = czt(symbol_TD, N, W, A);

    % Wyświetlenie wynikowego widma
    figure;
    plot(symbol_FD, '.');
    xlabel('Numer nośnej');
    ylabel('Amplituda');
    title('Widmo OFDM (dziedzina częstotliwości)');
    grid on;
end
