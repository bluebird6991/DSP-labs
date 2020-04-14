%### 5 ЧАСТОТНО-ВРЕМЕННОЕ ПРЕОБРАЗОВАНИЕ ФУРЬЕ ###%
clear;
close all;

Fs = 150;
T = 3;
ts= 0 : 1/Fs : T - 1/Fs;

f1 = 25;
f2 = 40;
f3 = 55;

x = sin(2*pi*f1*ts) +...
    sin(2*pi*f2*ts) +...
    sin(2*pi*f3*ts);

subplot(2,2,1);
plot(x); grid on; title('сигналы идут одновременно');
subplot(2,2,2);
stem(abs(fft(x))); grid on; title('БПФ сигналы идут одновременно');

t1 = 0 : 1/Fs : 1-1/Fs;
t2 = 1 : 1/Fs : 2-1/Fs;
t3 = 2 : 1/Fs : 3-1/Fs;

l1 = length(t1);
l2 = length(t2);
l3 = length(t3);

x1(1 : l1) = sin(2*pi*f1*t1);
x1(l1 + 1 : l1 + l2 ) = sin(2*pi*f2*t2);
x1(l1 + l2 + 1 : l1 + l2 + l3) = sin(2*pi*f3*t3);

subplot(2,2,3);
plot(x1); grid on; title('Сигналы идут друг за другом');

subplot(2,2,4);
stem(abs(fft(x1))); grid on; title('БПФ сигналы идут друг за другом');


figure;

subplot(2, 2, 1);
[WX,freq] = wft(x1,Fs,'f0',0.01);
srf = surf(ts, freq, abs(WX));
set(srf, 'LineStyle', 'none'); title('0.01');
xlabel('Время'); ylabel('Частота'); zlabel('Амплитуда');

subplot(2, 2, 2);
[WX,freq] = wft(x1,Fs,'f0',0.05);
srf = surf(ts, freq, abs(WX));
set(srf, 'LineStyle', 'none'); title('0.05')
xlabel('Время'); ylabel('Частота'); zlabel('Амплитуда');

subplot(2, 2, 3);
[WX,freq] = wft(x1,Fs,'f0',0.1);
srf = surf(ts, freq, abs(WX));
set(srf, 'LineStyle', 'none'); title('0.1')
xlabel('Время'); ylabel('Частота'); zlabel('Амплитуда');

subplot(2, 2, 4);
[WX,freq] = wft(x1,Fs,'f0',0.5);
srf = surf(ts, freq, abs(WX));
set(srf, 'LineStyle', 'none'); title('0.5')
xlabel('Время'); ylabel('Частота'); zlabel('Амплитуда');