clear all

Fs = 2000;
Wp = 0.025;
Ws = 0.050;

order = 200;

b = fir1(order, Wp + 0.01, 'low', chebwin(order + 1, 50));
% b = fir1(order, Wp, 'low');

figure;
freqz(b, 1, 4096, Fs);
title('Charakterystyka amplitudowa');

figure;
grpdelay(b, 1, 2048, Fs);
title('Opóźnienie grupowe filtra');

figure;
zplane(b, 1);
title('Zera i bieguny filtra na okręgu jednostkowym');
