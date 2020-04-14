%### 1 БЕРЕМ СРЕДНЕЕ ###%
clear;
close all;


Fs = 97;
ts = 0: 1/Fs : 16-1/Fs;
N = length(ts);

% параметры случайного сигнала
a = -0.01;
b = 0.1;

% Задаем случайные сигналы
%x = zeros(N);
%x(5) = 1;
x = (a + (b - a) * rand(1, N)).*sin(2*pi*0.5*ts);

figure;
subplot(2,1,1);
plot(x); grid on; title('Исходный сигнал');

y = zeros(1,N+6);
for i = 6 : length(x)
   y(i) = (x(i-1) + x(i-2) + x(i-3) + x(i-4) + x(i-5))*1/5;
end

subplot(2,1,2);
plot(y(1:100)); grid on; title('Усредненный сигнал');

%Функция Диракта
x = zeros(N);
x(50) = 1;

figure;
subplot(2, 1, 1);
stem(x); grid on; title('Функция Диракта');
xlabel('Время'); ylabel('Амплитуда');

z = zeros(1, N + 6);
for i = 6 : length(x)
    y(i) = (x(i - 1) + x(i - 2) + x(i - 3) + x(i - 4) + x(i - 5)) / 5;
end

subplot(2, 1, 2);
stem(y(1: 100)); grid on; title('Импульсная характеристика')
xlabel('Время'); ylabel('Амплитуда');