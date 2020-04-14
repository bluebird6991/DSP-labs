clear;

Fs = 80;
T = 3;
ts= 0:1/Fs:T-1/Fs;

f1 = 10;
f2 = 20;
f3 = 30;

% � ������� ����� ��� �������
x = sin(2*pi*f1*ts)+sin(2*pi*f2*ts)+sin(2*pi*f3*ts);
X = fft(x);

subplot(2,2,1);
plot(x);
subplot(2,2,2);
stem(abs(X)); grid on;

% ������ ������ � ����� ������ ������� ���������
t1= 0 : 1/Fs : 1-1/Fs;
x(1:length(t1))=sin(2*pi*f1*t1);

t2= 1 : 1/Fs : 2-1/Fs;
x(length(t1) + 1 : length(t1) + length(t2) ) = sin(2*pi*f2*t2);

t3= 2 : 1/Fs : 3-1/Fs;         
x((length(t1) + length(t2) + 1) : length(t1) + length(t2) + length(t3)) = sin(2*pi*f3*t3);

subplot(2,2,3);
plot(x); grid on;

X = fft(x);

subplot(2,2,4);
stem(abs(X)); grid on;

figure;
[WX,freq] = wft(x,Fs,'f0',0.5);
%f0 = 0.01 .. 0.5

srf = surf(ts, freq, abs(WX));
set(srf, 'LineStyle', 'none');

%cwt(x,Fs);
