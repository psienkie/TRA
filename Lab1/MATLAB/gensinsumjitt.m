function x = gensinsumjitt(A, phi, f, N, jitt, fs)
    if nargin < 5
        fs = 1;
    end

    x = sum(A.*sin(2*pi * ((0:N-1) + randn(1,N) * jitt) .* f/fs + phi), 1);
end