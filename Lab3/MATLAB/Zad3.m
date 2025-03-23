Fs = 2000;
Wp = 0.025;
Ws = 0.050;
ripple_passband = 1;
stopband_attenuation = 60;

% Filtr Butterwortha
[n_min, Wn] = buttord(Wp, Ws, ripple_passband, stopband_attenuation);
[num_butter, den_butter] = butter(n_min, Wn, 'low');

% Ustawienia kolorów dla trzech filtrów
colors = {'b', 'r', 'g'};

% Charakterystyka amplitudowa i fazowa
figure;
subplot(2, 1, 1);  % Wykres amplitudowy
hold on;
[h_butter, f] = freqz(num_butter, den_butter, 4096, Fs);
[h_cheby, ~] = freqz(num_chebyshev, den_chebyshev, 4096, Fs);
[h_ellip, ~] = freqz(num_eliptic, den_eliptic, 4096, Fs);
plot(f, 20*log10(abs(h_butter)), colors{1});
plot(f, 20*log10(abs(h_cheby)), colors{2});
plot(f, 20*log10(abs(h_ellip)), colors{3});
title('Charakterystyka amplitudowa');
xlabel('Częstotliwość [Hz]');
ylabel('Wzmocnienie [dB]');
legend('Butterworth', 'Czebyszew', 'Eliptyczny');
hold off;

subplot(2, 1, 2);  % Wykres fazowy
hold on;
plot(f, angle(h_butter), colors{1});
plot(f, angle(h_cheby), colors{2});
plot(f, angle(h_ellip), colors{3});
title('Charakterystyka fazowa');
xlabel('Częstotliwość [Hz]');
ylabel('Faza [rad]');
legend('Butterworth', 'Czebyszew', 'Eliptyczny');
hold off;

% Opóźnienie grupowe
figure;
hold on;
[gd_butter, f] = grpdelay(num_butter, den_butter, 2048, Fs);
[gd_cheby, ~] = grpdelay(num_chebyshev, den_chebyshev, 2048, Fs);
[gd_ellip, ~] = grpdelay(num_eliptic, den_eliptic, 2048, Fs);
plot(f, gd_butter, colors{1});
plot(f, gd_cheby, colors{2});
plot(f, gd_ellip, colors{3});
title('Opóźnienie grupowe');
xlabel('Częstotliwość [Hz]');
ylabel('Opóźnienie [próbki]');
legend('Butterworth', 'Czebyszew', 'Eliptyczny');
hold off;

% Zera i bieguny na okręgu jednostkowym
figure;
hold on;

% Butterworth
[z_butter, p_butter] = tf2zp(num_butter, den_butter);
plot(real(z_butter), imag(z_butter), 'bo', 'MarkerSize', 6, ...
    'DisplayName', 'Butterworth');
plot(real(p_butter), imag(p_butter), 'bx', 'MarkerSize', 8, ...
    'DisplayName', '');

% Czebyszew
[z_cheby, p_cheby] = tf2zp(num_chebyshev, den_chebyshev);
plot(real(z_cheby), imag(z_cheby), 'ro', 'MarkerSize', 6, ...
    'DisplayName', 'Czebyszew');
plot(real(p_cheby), imag(p_cheby), 'rx', 'MarkerSize', 8, ...
    'DisplayName', '');

% Eliptyczny
[z_ellip, p_ellip] = tf2zp(num_eliptic, den_eliptic);
plot(real(z_ellip), imag(z_ellip), 'go', 'MarkerSize', 6, ...
    'DisplayName', 'Eliptyczny');
plot(real(p_ellip), imag(p_ellip), 'gx', 'MarkerSize', 8, ...
    'DisplayName', '');

% Jednostkowy okrąg
theta = linspace(0, 2*pi, 1000);
plot(cos(theta), sin(theta), 'k--', 'DisplayName', 'Okrag jednostkowy');

% Ustawienia wykresu
axis equal;
xlim([-1.5, 1.5]);
ylim([-1.5, 1.5]);
title('Zera i bieguny na okręgu jednostkowym');
xlabel('Re');
ylabel('Im');
legend();
grid on;
hold off;


% Wypisanie rzędu filtru Butterwortha
fprintf("Rząd filtru Butterwortha: %d\n", n_min);
