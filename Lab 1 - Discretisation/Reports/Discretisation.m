clear;

f = 950;
max = 0.01;
min = 0;

fs1 = 900;
fs2 = 2000;
fs3 = 18000;

ts1 = min : 1/fs1 : max;
ts2 = min : 1/fs2 : max;
ts3 = min : 1/fs3 : max;

x1 = sin(2*pi*f*ts1);
x2 = sin(2*pi*f*ts2);
x3 = sin(2*pi*f*ts3);

plot(ts1, x1, '-ro', ts2, x2, '-b>', ts3, x3, '-g.'); grid on;
title('Discretisations');
xlabel('временные отсчеты');
ylabel('Амплитуда');

