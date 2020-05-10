%% �������������� ������ 
%% ���������� ������� ���������� ���� ������������ �������� 
% ���� ���������� Communications Toolbox 
% ���������� ��� �������, ��������� �� ���� �� 270 �������� 
close all; 
clear; 

Fs = 40; 
ts = 0 : 1/Fs : 5-1/Fs; 

x1 = sin(2*pi*1*ts); 
x2 = sin(2*pi*1*ts + 3*pi/2); 

figure; 
subplot(2,1,1); 
plot(x1); grid on; 
title('������ 1'); 

subplot(2,1,2); 
plot(x2); grid on; 
title('������ 2'); 

figure; 
r12 = sum(x1.*x2); 

[xc, lags] = xcorr(x1, x2); 

subplot(2,1,1); 
plot(lags, xc), grid on; 
title('������������ ������'); 

N = length(x1); 
x2 = [x2, x2]; 

r12 = zeros(1, N); 

for j = 1 : N-1 
r12(j) = sum(x1.*x2(j:j+N-1)); 
end 

subplot(2,1,2); 
plot(r12), grid on; 
xlabel('��������� �����, j'); 
ylabel('r_{12}[j]'); 
title('������� ������� ������'); 
%% 
% �.�. � ��� ������� ����� �������� ����� ��� ������ ������ ������ 
% ������������ �������,����� ��� �� ������������� � ������ ������ ������������ ���ޣ��� 
% �������� ������������ �� ?������ ���ޣ��?,� ��� ��� ��������, ������� �� 
% � ������� ���� ������, ���������� ������� ��������. 
% 
% �� �������� �����, ��� �������� ������� ������ � ���������� ����� ���� ��� ������� �������. 
% ��� ���������� ������ ����� ��� ������ �������� ����������,��� ��� ��������� ����������. 
%% ����������� ������, ����������� ���������� ������������� (��� �� ����������) ������������� ������� 
% ��� ������������ �������. �� ������� ������������������ ������� ���������� ����� �������������. 
clear; 

Fs = 40; 
ts = 0 : 1/Fs : 5 - 1/Fs; 
N = length(ts); 

x = 0.1 * sin(2 * pi * 0.5 * ts + 3 * pi / 4); 
x = awgn(x, 20); 

subplot(2, 1, 1); 
plot(x), grid on; 
title('�������� ������'); 
xlabel('�����'); 

[xc, lags] = xcorr(x, 'unbiased'); 
subplot(2, 1, 2); 
plot(lags/Fs, xc), grid on; 
title('������������������ �������'); 
xlabel('��������� �����'); 
%% 
% ��� ���������� �������. �� ������� �����, ��� ��� ��������� �������� ������ ������������������ ������� ����� ���� �������� ��� j = 0 � ��������� � ���� � ����������� ������ j 
clear; 

N = 1024; 
x = rand(1, N); 

[c, lags] = xcorr(x, 'coeff'); 

subplot(2, 1, 1); 
plot(x), grid on; 
title('��������� ������'); 
xlabel('��������� ���ޣ��, n'); 
ylabel('x[n]'); 

subplot(2, 1, 2); 
plot(lags, c), grid on; 
title('��� ���������� �������'); 
xlabel('��������� ���ޣ��, n'); 
ylabel('c[j]'); 

%% �������� �� ������������ ��������� ������ ?���? ���������� ������� �� ������� ��������. ����������� ������, ������� � ������� �������������� ������� ���������� ���. 
% 
clear; 
[x, Fs] = audioread('tatarskaya.wav', [1, 10000]); 

figure(1); 
subplot(3,1,1); 
plot(x), grid on; 
title('�������� ������'); 

a = 0.5; 
d = 15000; 

y = x; 
for i = d+1 : length(x) 
y(i) = x(i)+a*x(i-d); 
end 

figure(1) 
subplot(3,1,2); 
plot(y), grid on; 
title('������ � �������� ���'); 

[corr_f, lags] = xcorr(y, 'coeff'); 

corr_f = corr_f(lags>0); 
lags = lags(lags>0); 

figure(2); 
subplot(2, 1, 1); 
plot(lags/Fs, corr_f), grid on; 
title('������������������ �������'); 

subplot(2, 1, 2); 
findpeaks(corr_f,lags,'MinPeakHeight', 0.3); 
[peaks, dl] = findpeaks(corr_f(200:length(corr_f)), lags(200:length(corr_f)), 'MinPeakHeight', 0.3); 
title('���� ������������������ �������'); 

y_clean = filter(1,[1 zeros(1,dl-1) 0.5],y); 

figure(1); 
subplot(3,1,3); 
plot(y_clean), grid on; 
title('��������������� ������'); 

%% ����������� ������, ������� � ������� ��������� ���������� ��������� ����� ������ ����������� ������ ������� �����������. 
% ������������� Image Processing Toolbox 
clear; 

% ������� ������� 
face = imread('desired image.jpg'); 
faceGray = rgb2gray(face); 

figure(1); 
imshow(faceGray); 
title('������� �������') 
% �������� �������� 
img = imread('source image.jpg'); 
imgGray = rgb2gray(img); 

figure(2); 
imshow(img); 
title('�������� ��������'); 

%�������������� ������� 
Corr = normxcorr2(faceGray,imgGray); 

figure(3); 
plot(Corr), grid on; 
title('�������������� ������'); 

figure(4); 
srf = surf(Corr); 
set(srf, 'LineStyle', 'none'); 

%����� ��������� �������������� �������
 
[maxVal,maxIndex] = max(abs(Corr(:))); 
[max_Y,max_X] = ind2sub(size(Corr),maxIndex); 

%������ ������������� ������ ��������� ����. ������� 
figure(5); 
%hold on; 
imshow(img); 
rectangle('Position',[(max_X-90) (max_Y-90) 100 100],'LineWidth',4,'EdgeColor','w'); 
title('���������');