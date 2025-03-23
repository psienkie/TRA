function [Theta, epsilon] = LM_estimator(signal, frame_length, cyclic_prefix, rho)
    
    N = round(frame_length);
    L = round(frame_length * cyclic_prefix);
    
    corr = zeros(size(signal));
    corr(1:end-N) = signal(1:end-N) .* conj(signal(1+N:end));
    
    gamma = zeros(size(signal));
    gamma(1) = sum(corr(1:L));
    for i = 2:length(signal)-L
        gamma(i) = gamma(i-1) - corr(i-1) + corr(i+L);
    end
    
    corr(1:end-N) = rho / 2 * (abs(signal(1:end-N)).^2 + abs(signal(1+N:end)).^2);
    
    Phi = zeros(size(signal));
    Phi(1) = sum(corr(1:L));
    for i = 2:length(signal)-L
        Phi(i) = Phi(i-1) - corr(i-1) + corr(i+L);
    end
    
    Phi = Phi/2;
    
    Theta = abs(gamma) - Phi;
    Theta(end-N-L-L+1:end) = [];
    
    epsilon = -angle(gamma)/2/pi;
    epsilon(end-N-L-L+1:end) = [];
end