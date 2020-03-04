clear;

[x, Fs] = audioread('rock.wav');

subplot(4, 1, 1);
plot(x(:, 1))
grid on;

y = flip(x);

y = zeros(size(x));
z = zeros(size(x));
for i = 1 : length(x(:, 1))
    y(i, 1) = x(i, 1)*sin(i/1000);
    z(i) = sin(i/1000);
end

subplot(4, 1, 2);
plot(z); grid on;

subplot(4, 1, 3);
plot(y); grid on;

x1(1 : length(x)) = sin((1 : length(x))/1000);
subplot(4, 1, 4);
plot(x1);

%sound(x1, Fs);