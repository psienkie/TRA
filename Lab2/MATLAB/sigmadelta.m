function [y, e] = sigmadelta(x)

x_length = length(x);
y = zeros(1, x_length);
e = zeros(1, x_length);

b = 0;
c = 0;

for i=2:x_length
    a = x(i) - y(i-1);

    b = a + c;

    if b >= 0
        y(i) = 1;
    else
        y(i) = -1;
    end

    e(i) = y(i) - b;

    c = b;

end

end
