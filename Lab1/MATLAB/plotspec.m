function plotspec(x, fs)
    if nargin < 2
        fs = 1;
    end

    N = size(x,2);
    fAxis = getFAxis(N, fs);

    X = db(abs(fftshift(fft(x,[],2))));
    X = max(X, db(eps));
    plot(fAxis, X);
end

function fAxis = getFAxis(N, fs)
    n = fftshift(0:N-1);
    n(1:floor(end/2)) = n(1:floor(end/2))-N; 
    fAxis = n/N*fs;
end