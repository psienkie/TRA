function y = quant(x, q)
    y = round(x ./ q) .* q;
end