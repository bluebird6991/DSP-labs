%% ���������� ������� 
%% ������� ������� ���������; 
% �������������� ������� ��������� ��� ����������� ������, 
% � ��� ������� ������������ ���������� ������ ���������� z?��������������. 
% G = (10s^2+5s+20)/(10s^3+5s^2+2.5s^1+10) 
% �= (s+3)/(3s+3) 
close all; 
clear; 
a = [10 5 20];
b = [10 5 2.5 10];
G = tf(a, b); 
Gd = c2d (G ,0.1);
a1 = [1 3];
b1 = [3 3];
C = tf(a1, b1); 
Cd = c2d (C ,0.1); 
Gcld = feedback(Gd,Cd);
k1 = 2; Gcld1 = feedback(Gd*k1,Cd); 
k2 = 4; Gcld2 = feedback(Gd*k2,Cd); 
k3 = 5; Gcld3 = feedback(Gd*k3,Cd);
%% ������ �������� ��������. 
% �� ���������� ��������� ������� � ����������� �� ���������� �������� 
% ���� ������ ��������� ������ ����������, ������� ���������, �� ����������� �� ��������� 
figure;
rlocus(Gcld); grid on;
%% ������ ��������� �������� ��������� 
% ��� ������������ �������� �� ������ ���������� ����� (-1;0), ��� �� � �� ������ ������ ������� ��������� 
figure; 
subplot(2, 2, 1);
nyquist(Gcld); grid on; title('k = 1 -> ���������� �������');
subplot(2, 2, 2);
nyquist(Gcld1); grid on; title('k = 2 -> ���������� �������');
subplot(2, 2, 3);
nyquist(Gcld2); grid on; title('k = 4 -> �� ���������� �������');
subplot(2, 2, 4);
nyquist(Gcld3); grid on; title('k = 5 -> �� ���������� �������');

%% ������ ������� ������� �� ��������� 
figure; 
subplot(2, 2, 1);
step(Gcld); grid on; title('k = 1 -> ���������� �������');
subplot(2, 2, 2);
step(Gcld1); grid on; title('k = 2 -> ���������� �������');
subplot(2, 2, 3);
step(Gcld2); grid on; title('k = 4 -> �� ���������� �������');
subplot(2, 2, 4);
step(Gcld3); grid on; title('k = 5 -> �� ���������� �������');
%% 
% ��� ������ ������������� �������� 
figure;  
step(Gcld,'b',Gcld1,'r',Gcld2,'g',Gcld3,'m',20), grid on, 
legend('k = 1','k = 2','k = 4','k = 5') 

%% ���������� �������������� ������� 
figure;
subplot(2, 2, 1);
impulse(Gcld); grid on; title('k = 1 -> ���������� �������');
subplot(2, 2, 2);
impulse(Gcld1); grid on; title('k = 2 -> ���������� �������');
subplot(2, 2, 3);
impulse(Gcld2); grid on; title('k = 4 -> �� ���������� �������');
subplot(2, 2, 4);
impulse(Gcld3); grid on; title('k = 5 -> �� ���������� �������');