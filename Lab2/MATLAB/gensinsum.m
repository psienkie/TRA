function x = gensinsum(A, phi, f, N, fs)
    if nargin < 5
        fs = 1;
    end

    x = sum(A.*sin(2*pi * ((0:N-1) .* f/fs + phi)),1);
end