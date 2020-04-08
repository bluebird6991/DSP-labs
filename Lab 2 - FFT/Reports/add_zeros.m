%### 3 ץלץ‏ûומיו עותץלרפבפב גנז ף נןםן‎רא הןגבקלומיך מץלוך ###%
clear;
close all;

fs = 2;
ts = 0 : 1/fs : 20-1/fs;

x = cos(2*pi*0.15*ts);

N1 = 32;
N2 = 512;
N3 = 1024;

X1 = abs(fft(x, N1));
X2 = abs(fft(x, N2));
X3 = abs(fft(x, N3));

F1 = (0 : N1-1)*fs/N1;
F2 = (0 : N2-1)*fs/N2;
F3 = (0 : N3-1)*fs/N3;

figure;
subplot(3, 1, 1);
plot(F1, X1, '-x'), grid on, title([num2str(N1)]);
subplot(3, 1, 2);
plot(F2, X2, '-x'), grid on, title([num2str(N2)]);
subplot(3, 1, 3);
plot(F3, X3, '-x'), grid on, title([num2str(N3)]);