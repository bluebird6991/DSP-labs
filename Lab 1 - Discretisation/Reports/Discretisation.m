clear;

fs1 = 60;
fs2 = 15;
fs3 = 200;

ts1 = 0 : 1/fs1 : 5;
ts2 = 0 : 1/fs2 : 5;
ts3 = 0 : 1/fs3 : 5;

x1 = sin(2*pi*10*ts1);
x2 = sin(2*pi*10*ts2);
x3 = sin(2*pi*10*ts3);

plot(ts1, x1, '-ro', ts2, x2, '-b>', ts3, x3, '-g.'); grid on;
title('Discretisations');
xlabel('временные отсчеты');
ylabel('Амплитуда');

