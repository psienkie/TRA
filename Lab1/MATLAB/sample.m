function y = sample(x, N)
    q = 2 / 2^(N);
    
    y = quant(saturate(x, q), q);
end

function y = saturate(x, q)
    y = min(max(x,-1), 1-q);
end
