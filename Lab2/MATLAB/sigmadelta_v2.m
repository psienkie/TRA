function [y, e] = sigmadelta_v2(x)

y = zeros(1, length(x));
e = zeros(1, length(x));
b = zeros(1, length(x));

for i=1:length(x)
    if i == 1
        d = 0;
        c = 0;
    else
        d = y(i-1);
        c = b(i-1);
    end

    a = x(i) - d;
    b(i) = a + c;

    if b(i) >= 0
        y(i) = 1;
    else
        y(i) = -1;
    end

    e(i) = y(i) - b(i);
end


end