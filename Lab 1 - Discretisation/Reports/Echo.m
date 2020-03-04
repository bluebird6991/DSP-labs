clear;

[x, fs] = audioread('rock.wav');
%{
subplot(2, 1, 1);
plot(x(:, 1)); grid on;
subplot(2, 1, 2);
plot(x(:, 2)); grid on;

a = 0,5;
d = 10000;

y = zeros(size(x));
y = x;
for i = d+1 : length(x)
    y(i) = x(i) + a*x(i-d);
end 
%}

N = length(x);

delay_cnt = 2*fs;
delay_max = round(0.005*fs);
delay_1 = round(linspace(0, delay_max, delay_cnt));
delay_2 = round(linspace(delay_max, 0, delay_cnt));
delay = [delay_1 delay_2];
n_rep = round(N / length(delay));
delay = repmat(delay, 1, n_rep+1);

y = zeros(1, N);
for i = 1 : N
    n = i - delay(i);
    if n>0
        y(i)=x(i)+x(i) ;
    else
        y(i)= x(i);
    end
end

audiowrite('rock-out.wav', y, fs);
%{
for i = d+1 : length(x)
    y(i) = x(i)
end
%}
%sound(y(1 : 100000), fs);