function cp_corr = correlate_cp(signal, symbol_length, CP)
    prefix_index = round(symbol_length * CP);
    symbol_length = round(symbol_length);

    corr = zeros(size(signal));
    corr(1:end-symbol_length) = ...
        signal(1:end-symbol_length) .* conj(signal(1+symbol_length:end));
    
    cp_corr = zeros(size(signal));
    cp_corr(1) = sum(corr(1:prefix_index));
    for i = 2:length(signal)-prefix_index
        cp_corr(i) = cp_corr(i-1) - corr(i-1) + corr(i+prefix_index);
    end

%     symbol_length = round(symbol_length);
%     CP = round(CP);
%     b = ones(1, CP)/CP;
%     cp_corr = signal(1:end-symbol_length).*conj(signal(symbol_length+1:end));
%     cp_corr = filter(b, 1, cp_corr);
end