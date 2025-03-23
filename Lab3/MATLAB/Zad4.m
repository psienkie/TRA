Fs = 2000;

% Sygnał impulsowy
impulse = [1; zeros(99,1)]; 
impulse_response = filter(Num, Den, impulse);

% Sygnał skokowy
step = ones(100, 1);
step_response = filter(Num, Den, step);

% Sinusoida w paśmie zaporowym
sin_stop = gensinsum(1, 0, Fs/200, 400, Fs);
sin_stop_response = filter(Num, Den, sin_stop);

% Sinusoida w paśmie przepustowym
sin_pass = gensinsum(1, 0, Fs/6, 400, Fs);
sin_pass_response = filter(Num, Den, sin_pass);


fprintf("Max numerator coefficient: %.8f \n", max(abs(Num)));
fprintf("Min numerator coefficient: %.8f \n", min(abs(Num)));
fprintf("Max denominator coefficient: %.8f \n", max(abs(Den)));
fprintf("Min denominator coefficient: %.8f \n", min(abs(Den)));


% Wykresy wyników
figure;
stem(impulse_response);
title('Odpowiedź impulsowa');

figure;
plot(step_response);
title('Odpowiedź skokowa');

figure;
plot(sin_stop_response);
title('Sinusoida w paśmie zaporowym');

figure;
plot(sin_pass_response);
title('Sinusoida w paśmie przepustowym');


% Obliczanie odpowiedzi dla filtrow SOS
impulse_response_sos = sosfilt(SOS1, impulse);
step_response_sos = sosfilt(SOS1, step);
sin_stop_response_sos = sosfilt(SOS1, sin_stop);
sin_pass_response_sos = sosfilt(SOS1, sin_pass);


% Wykresy wyników dla SOS
figure;
stem(impulse_response_sos);
title('Odpowiedź impulsowa (SOS)');

figure;
plot(step_response_sos);
title('Odpowiedź skokowa (SOS)');

figure;
plot(sin_pass_response_sos);
title('Sinusoida w paśmie przepustowym (SOS)');

figure;
plot(sin_stop_response_sos);
title('Sinusoida w paśmie zaporowym (SOS)');
