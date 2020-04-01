%Task1
%Сравнение преобразований Фурье (написанный нами (ДПФ) и встроенной функцией (БПФ))
%БПФ-Быстрое преобразование Фурье
%ДПФ-Дискретное преобразование Фурье
clear;
fs = 8000;

ts = 0 : 1/fs : 0.001-1/fs;
N = length(ts);

x = sin(2*pi*1300*ts) + 0.5*sin(2*pi*2100*ts + 3*pi/4);

plot(x);
grid on
title("Исходный сигнал");

Y = zeros(N);


tic;
X1 = zeros(N);
for m = 1 : N
   for n = 1 : N
       X1(m) = X1(m)+ x(n) * (cos(2*pi*(m-1)*(n-1)/N)-...
           1i*sin(2*pi*(m-1)*(n-1)/N));
   end 
end
toc;
 
tic;
X=fft(x);
toc;

figure;
subplot(2, 1, 1);
stem(real(X));
grid on;
title('Действ часть БПФ');
subplot(2, 1, 2);
stem(imag(X));
grid on;
title('Мнимая часть БПФ');

figure;
subplot(2, 1, 1);
stem(abs(X));
grid on;
title('Амплитуда БПФ');
subplot(2, 1, 2);
stem(angle(X)*180/pi);
grid on;
title('Фаза БПФ');

Xm = 2*abs(X) / N;
F = (0 : N-1)*fs/N;

figure;
stem(F, Xm);
grid on;
title('Нормированная амплитуда и частота БПФ');

subplot(2,1,1)
stem(real(X1));grid on;
title("Действительная часть ДПФ");

subplot(2,1,2)
stem(imag(X1));grid on;
title("Мнимая часть ДПФ");

subplot(2,1,1);
stem(abs(X1));grid on;
title("Амплитуда ДПФ")
 
subplot(2,1,2);
stem(angle(X1)*180/pi);
title("Фаза ДПФ"); grid on;

Xm=2*abs(X1)/N;
F = (0:N-1) *fs/N;
figure;
stem(F,Xm);
title("Нормированная амплитуда и частота ДПФ"); 

% По  двум tic-toc можем заметить насколько быстрее работает Быстрое преобразование Фурье








