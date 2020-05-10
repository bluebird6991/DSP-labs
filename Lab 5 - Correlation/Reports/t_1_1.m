%% �������������� ������ 
%% ���������� ������� ���������� ���� ������������ �������� 
% ���� ���������� Communications Toolbox 
% ���������� ��� �������, ��������� �� ���� �� 180 �������� 
close all; 
clear; 

Fs = 80; 
ts = 0 : 1/Fs : 6-1/Fs; 

x1 = sin(2*pi*1*ts); 
x2 = sin(2*pi*1*ts +    pi); 

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
% �������� ������������ �� ������ ���ޣ��,� ��� ��� ��������, ������� �� 
% � ������� ���� ������, ���������� ������� ��������. 
% 
% �� �������� �����, ��� �������� ������� ������ � ���������� ����� ���� ��� ������� �������. 
% ��� ���������� ������ ����� ��� ������ �������� ����������,��� ��� ��������� ����������. 
%% ����������� ������, ����������� ���������� ������������� (��� �� ����������) ������������� ������� 
% ��� ������������ �������. �� ������� ������������������ ������� ���������� ����� �������������. 
clear; 

Fs = 80; 
ts = 0 : 1/Fs : 6 - 1/Fs; 
N = length(ts); 

x = 0.1 * sin(2 * pi * 0.5 * ts + 3 * pi / 4); 
x = awgn(x, 20);

figure
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

N = 512; 
x = rand(1, N); 

[c, lags] = xcorr(x, 'coeff'); 
figure;
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

%% �������� �� ������������ ��������� ������ ��� ���������� ������� �� ������� ��������. ����������� ������, ������� � ������� �������������� ������� ���������� ���. 
% 
clear; 
[x, Fs] = audioread('test.wav', [1, 100000]); 

figure; 
subplot(5,1,1); 
plot(x), grid on; 
title('�������� ������'); 

a = 0.8; 
d = 15000; 

y = x; 
for i = d+1 : length(x) 
    y(i) = x(i)+a*x(i-d); 
end 

subplot(5,1,2); 
plot(y), grid on; 
title('������ � �������� ���'); 

[corr_f, lags] = xcorr(y, 'coeff'); 

corr_f = corr_f(lags>0); 
lags = lags(lags>0); 
 
subplot(5, 1, 3); 
plot(lags/Fs, corr_f), grid on; 
title('������������������ �������'); 

subplot(5, 1, 4); 
findpeaks(corr_f,lags,'MinPeakHeight', 0.3); 
[peaks, dl] = findpeaks(corr_f(200:length(corr_f)), lags(200:length(corr_f)), 'MinPeakHeight', 0.3); 
title('���� ������������������ �������'); 

y_clean = filter(1,[1 zeros(1,dl-1) 0.5],y); 

subplot(5,1,5); 
plot(y_clean), grid on; 
title('��������������� ������'); 

%% ����������� ������, ������� � ������� ��������� ���������� ��������� ����� ������ ����������� ������ ������� �����������. 
% ������������� Image Processing Toolbox 
clear; 

% ������� ������� 
face = imread('find.jpg'); 
faceGray = rgb2gray(face); 

figure; 
imshow(faceGray); 
title('������� �������') 
% �������� �������� 
img = imread('test.jpg'); 
imgGray = rgb2gray(img); 

figure; 
imshow(img); 
title('�������� ��������'); 

%�������������� ������� 
Corr = normxcorr2(faceGray,imgGray);

figure; 
plot(Corr), grid on; 
title('�������������� ������'); 

figure; 
srf = surf(Corr); 
set(srf, 'LineStyle', 'none'); 

%����� ��������� �������������� �������
 
[maxVal,maxIndex] = max(abs(Corr(:))); 
[max_Y,max_X] = ind2sub(size(Corr),maxIndex); 

%������ ������������� ������ ��������� ����. ������� 
figure; 
%hold on; 
imshow(img); 
rectangle('Position',[(max_X-90) (max_Y-90) 100 100],'LineWidth',4,'EdgeColor','w'); 
title('���������');