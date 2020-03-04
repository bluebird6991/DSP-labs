clear;

[x, Fs] = audioread('rock.wav');

subplot(3, 1, 1);    %функция вывода нескольких графиков
plot(x(:, 1))
grid on;
%subplot(2, 1, 2);
%plot(x(:, 2))
%grid on;

%y(:,1)=x(:,1)*2;  %удваиваем амплитуду
%y(:,2)=x(:,1)/2;

y = flip(x);

y = zeros(size(x));
z = zeros(size(x));
for i=1 : length(x(:, 1))
    y(i, 1) = x(i, 1)*sin(i/1000);
    z(i) = sin(i/1000);
    %y(i, 2) = x(i, 2)*sin(i/2000);
end

subplot(3, 1, 2);
plot(z); grid on;

subplot(3, 1, 3);
plot(y); grid on;
%figure;           %показать график в новом окне
%plot(y)
%grid on;

%audiowrite('tada-out.wav', y, Fs)

%sound (y, Fs)


