function y = sigmadelta2(x)

[y1, e1] = sigmadelta(x);
y2 = sigmadelta(e1);
y = zeros(1, length(x));

b = y2(1);
for i=2:length(x)
    a = y2(i) - b;
    y(i) = y1(i) - a;

    b = y2(i);

end

end