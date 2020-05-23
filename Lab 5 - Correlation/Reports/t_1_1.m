%% �������������� ������ 
%% ��������� ������ �������������� ������� ���� ������������ ��������.
close all; 
clear; 

Fs = 100; 
ts = 0 : 1/Fs : 10-1/Fs; 

x1 = (square(2*pi*1*ts) + 1)/2; 
x2 = sin(2*pi*1*ts);

figure; 
subplot(3,1,1); 
plot(x1); grid on; 
title('������ 1'); 

subplot(3,1,2); 
plot(x2); grid on; 
title('������ 2'); 
 
r12 = sum(x1.*x2); 

[r12, lags] = xcorr(x1, x2); 

subplot(3,1,3); 
plot(lags, r12), grid on; xlabel('��������� �����, j'), ylabel('r_{12}[j]');
title('������������ ������');

%% ����������� ������, ����������� ����������� ������������� ������� (��� �� ����������) ������������� �������
clear; 

Fs = 100; 
ts = 0 : 1/Fs : 10-1/Fs;
N = length(ts);

x = square(2*pi*1*ts)/2;
x = awgn(x, 30);

y = 1 * rand(1, N);

figure;
subplot(4, 1, 1);
plot(x); grid on; title('�������� ������');
xlabel('�����');

[c, lags] = xcorr(x, 'coeff');
subplot(4, 1, 2);
plot(lags, c); grid on; title('��� ������������ �������');
xlabel('��������� �����, j'); ylabel('c[j]');

subplot(4, 1, 3);
plot(y); grid on; title('�������� ������');
xlabel('�����');

[c, lags] = xcorr(y, 'coeff');
subplot(4, 1, 4);
plot(lags, c); grid on; title('��� ���������� �������');
xlabel('��������� �����, j'); ylabel('c[j]');

%% �������� �� ������������ ��������� ������ "���" ���������� ������� �� ������� ��������. ����������� ������, ������� � ������� �������������� ������� ���.
clear;

[x, fs] = audioread('test.wav');
% ������� ��������� ������� ��� ������
figure;
subplot(5, 1, 1);
plot(x(:, 1)); grid on; title('�������� ������');

a = 0.7; %���������
d = 5000; %���������� �������� ��� ��������

z = zeros(size(x));
z = x;
for i = d+1 : length(x)
    z(i) = x(i) + a*x(i-d);
end

subplot(5, 1, 2);
plot(z(:, 1)); grid on;  title('������ � ������� ���');


[corr, lags] = xcorr(z, 'coeff'); 
 
corr = corr(lags>0); 
lags = lags(lags>0); 
  
subplot(5, 1, 3); 
plot(lags/fs, corr), grid on; 
title('������������������ �������'); 
 
subplot(5, 1, 4); 
findpeaks(corr,lags,'MinPeakHeight', 0.3); 
[peaks, dl] = findpeaks(corr(100:length(corr)), lags(100:length(corr)), 'MinPeakHeight', 0.3); 
title('���� ������������������ �������'); 
 
y_clean = filter(1,[1 zeros(1,dl - 1) 0.5],z); 
 
subplot(5,1,5); 
plot(y_clean), grid on; 
title('��������������� ������'); 

%% ����������� ������, ������� � ������� ������������������� ��������� ����� ������ ����������� ������ ������� �����������.
%

clear; 

% ������� ������� 
part = imread('find.jpg');
picture = imread('test.jpg'); 
faceGray = rgb2gray(part);
imgGray = rgb2gray(picture);

figure;
subplot(2, 2, 1);
imshow(faceGray); 
title('������� �������') 

subplot(2, 2, 2);
imshow(picture); 
title('�������� ��������'); 
 
Corr = normxcorr2(faceGray,imgGray);

subplot(2, 2, 3);
plot(Corr), grid on; 
title('�������������� ������'); 

[maxVal,maxIndex] = max(abs(Corr(:))); 
[max_Y,max_X] = ind2sub(size(Corr),maxIndex);

[x, y, z] = size(part);

subplot(2, 2, 4);
imshow(picture);
rectangle('Position',[(max_X- y) (max_Y- x) y x],'LineWidth',4,'EdgeColor','w'); 
title('���������');
