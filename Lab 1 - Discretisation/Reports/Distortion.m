clear;

[x, Fs] = audioread('rock.wav');

subplot(2, 1, 1);
plot(x(:, 1)); grid on;  title('Исходный сигнал');
%subplot(2, 1, 2);
%plot(x(:, 2)); grid on;

val = 0.75;

y = x;

for i = 1:length(x)
    if y(i,1) > val
        y(i,1) = val;
    end
    if y(i,1) < -val
        y(i,1) = -val;
    end
    %if y(i,2) > val
    %    y(i,2) = val;
    %end
    %if y(i,2) < -val
    %    y(i,2) = -val;
    %end
end

%plot(y); grid on
subplot(2, 1, 2);
plot(y(:, 1)); grid on;  title('Сигнла с эфектом дисторшн');
audiowrite('Distortion-out.wav', y, Fs)

sound (y(1 : 100000), Fs)
