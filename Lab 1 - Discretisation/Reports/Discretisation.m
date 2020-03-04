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
ts4 = min : 1/fs3 : max;
ts5 = min : 1/fs3 : max;

x1 = sin(2*pi*f*ts1);
x2 = sin(2*pi*f*ts2);
x3 = sin(2*pi*f*ts3);

x4 = 3 * sin(2*pi*f*ts4);
x5 = 1 / 3 * sin(2*pi*f*ts5);

subplot(4, 1, 1)
plot(ts1, x1, '-ro', ts2, x2, '-b>', ts3, x3, '-g.'); grid on; title('Исходный сигнал');
xlabel('временные отсчеты');
ylabel('Амплитуда');

subplot(4, 1, 2);
plot(ts1, x1, '-ro'); grid on; title('Частота дискретизации 900');
xlabel('временные отсчеты');
ylabel('Амплитуда');

subplot(4, 1, 3);
plot(ts2, x2, '-b>'); grid on; title('Частота дискретизации 2000');
xlabel('временные отсчеты');
ylabel('Амплитуда');

subplot(4, 1, 4);
plot(ts3, x3, '-g.'); grid on; title('Частота дискретизации 1800');
xlabel('временные отсчеты');
ylabel('Амплитуда');

figure;
subplot(2, 1, 1);
plot(ts4, x4, '-ro'); grid on; title('Увиличили амплитуду в 3 раза');
xlabel('временные отсчеты');
ylabel('Амплитуда');

subplot(2, 1, 2);
plot(ts5, x5, '-ro'); grid on; title('Уменьшили амплитуду в 3 раза');
xlabel('временные отсчеты');
ylabel('Амплитуда');

%subplot(4, 1, 4);
%plot(ts4, x4, '-ro') grid on;

%title('Discretisations');
xlabel('временные отсчеты');
ylabel('Амплитуда');

