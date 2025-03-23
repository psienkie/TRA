elimination_transient_states = 0;

Fs = 48000;
signal_frequency = 2000;
T = 30;
N = T * Fs;
block_size = 4096;
num_blocks = ceil(N / block_size);

signal = gensinsum(1, 0, signal_frequency, N, Fs);
filtered_signal = zeros(size(signal));

filter_order = length(Num) - 1;
overlap = filter_order;

if elimination_transient_states == 1
    prev_tail = zeros(1, overlap);

    for i = 1:num_blocks
        start_idx = (i - 1) * block_size + 1;
        end_idx = min(i * block_size, N);

        block = signal(start_idx:end_idx);
        extended_block = [prev_tail, block];

        filtered_extended_block = fftfilt(Num, extended_block);
        filtered_signal(start_idx:end_idx) = filtered_extended_block( ...
            overlap+1:end);

        prev_tail = block(end-overlap+1:end);
    end

else
    for i = 1:num_blocks
        start_idx = (i - 1) * block_size + 1;
        end_idx = min(i * block_size, N);

        block = signal(start_idx:end_idx);
        filtered_block = fftfilt(Num, block);
        filtered_signal(start_idx:end_idx) = filtered_block;
    end
end

figure;
subplot(2, 1, 1);
plot(signal);
title('Oryginalny sygnał sinusoidalny');
xlabel('Próbka');
ylabel('Amplituda');

subplot(2, 1, 2);
plot(filtered_signal);
title('Przefiltrowany sygnał');
xlabel('Próbka');
ylabel('Amplituda');

sound(filtered_signal, Fs);
