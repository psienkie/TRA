clear all

% Parametry sygnału
N = 1000;         
f0_norm = 0;      
f1_norm = 0.1;     
repetitions = 5;
noise_amplitude = 8;

t = (0:repetitions*N-1) / N;

x1 = chirp(1:N, f0_norm, N, f1_norm, 'linear', 'complex');
x2 = repmat(x1, 1, repetitions);
noise = noise_amplitude*complex(randn(size(x2)), randn(size(x2)));
x2_with_noise = x2 + noise;

signal_power_in = mean(abs(x2).^2);   
noise_power_in = mean(abs(noise).^2);       
SNR_in = 10 * log10(signal_power_in / noise_power_in); 

fprintf("noise_amplitude = %.2f \n", noise_amplitude);
fprintf("SNR_in = %f \n", SNR_in);

% Filtr dopasowany
B = conj(x1(end:-1:1));
y = filter(B, 1, x2_with_noise);

signal_peak_out = max(abs(y));              
noise_out = abs(y);                              
noise_out(abs(y) > 150) = 0; % usuwanie probek o wartosci wiekszej niz 150
SNR_out = 10 * log10(signal_peak_out / mean(noise_out)); 

fprintf("SNR_out = %f \n\n", SNR_out);
