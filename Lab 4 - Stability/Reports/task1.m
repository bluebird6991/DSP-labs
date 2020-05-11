%% ��� ����������� � ���������� ������� � ������������ ������������ ��������������� �������� ������ ������������. 
%% ������ ������� ��������� 
% ���� ���������� ����� control system toolbox 
% G = (10s^2+5s+20)/(10s^3+5s^2+2.5s^1+10)-������������ ������� ����������� ������� 
% c2d ������������ ������ �� ������������ � ���������� ����� � �������� 0.1 
% feedback - ���������� ������ ������ sys ��� ����������� ������������� �������� ����� 
% �������� ������ (G,1), 1- ��� �� ���� ��� ��������� ��������� ������� 
close all; 
clear;
a = [10, 5, 20];
b = [10, 5, 2.5, 10];
G = tf(a, b);
Gd = c2d (G ,0.1); 
Gcld = feedback(Gd*2, 1);
k1 = 2; Gcld1 = feedback(G*k1,1); 
k2 = 3; Gcld2 = feedback(G*k2,1); 
k3 = 4; Gcld3 = feedback(G*k3,1);
%% ������ ������ ������� 
% ���� ��� ��� ����� �� ��� �������, ������� ���������. 
% � ����� ������ ���������, ��� ��������� ����� 
pole(Gcld)
pole(Gcld1)
pole(Gcld2)
pole(Gcld3)

figure;
subplot(2, 2, 1);
pzmap(Gcld); grid on; title('k = 1 -> �� ���������� �������');
subplot(2, 2, 2);
pzmap(Gcld1); grid on; title('k = 2 -> �� ���������� �������');
subplot(2, 2, 3);
pzmap(Gcld2); grid on; title('k = 3 -> ���������� �������');
subplot(2, 2, 4);
pzmap(Gcld3); grid on; title('k = 4 -> ���������� �������');
%% ������ �������� �������� 
% ���������� ������������ ������� � ����������� �� ������������ ��������. 
figure;
subplot(2, 2, 1)
rlocus(Gcld); grid on; title('k = 1 -> �� ���������� �������');
subplot(2, 2, 2)
rlocus(Gcld1); grid on; title('k = 2 -> �� ���������� �������');
subplot(2, 2, 3)
rlocus(Gcld2); grid on; title('k = 3 -> ���������� �������');
subplot(2, 2, 4)
rlocus(Gcld3); grid on; title('k = 4 -> ���������� �������');

%% ������ ��������� ���� (��� � ���) 
% 
% ����� ����� ������������ �������. 
% ������� margin-������� ��� � ��� �� ���� � ����� ������ ��� ����� ������������ �������.��� ������ �����������. 
% �� ��� ���� ����������� � ���� �, �� ����� ��������� �� ����� ������� ���������� ����� ���������� �� �� ������ ��� � ������� ����� ��������� �� ���� 
% �� ��� �������� ������ �� -180, ���� ����� ����������� � �������� ���������� ��� ����� �� ��� � �������� ����� �� ��������� 
% ���� Pm>0 � Gm>0 , �� ������� ����������. � ����� ������ ��� ���������. 

figure;
margin(Gd); grid on;
%% ������ ��������� �������� ��������� 
% ��� ������������ �������� �� ������ ���������� ����� (-1;0), ��� �� � �� ������ ������ ������� ��������� 
figure; title('�������� ���������'); 
subplot(2, 2, 1);
nyquist(Gcld); grid on; title('k = 1 -> �� ���������� �������');
subplot(2, 2, 2);
nyquist(Gcld1); grid on; title('k = 2 -> �� ���������� �������');
subplot(2, 2, 3);
nyquist(Gcld2); grid on; title('k = 3 -> ���������� �������');
subplot(2, 2, 4);
nyquist(Gcld3); grid on; title('k = 4 -> ���������� �������');

%% ������ ������� ������� �� ��������� 
figure;
subplot(2, 2, 1);
step(Gcld); grid on; title('k = 1 -> �� ���������� �������');
subplot(2, 2, 2);
step(Gcld1); grid on; title('k = 2 -> �� ���������� �������');
subplot(2, 2, 3);
step(Gcld2); grid on; title('k = 3 -> ���������� �������');
subplot(2, 2, 4);
step(Gcld3); grid on; title('k = 4 -> ���������� �������');
%% 
% ��� ������ ������������� �������� 
figure;
step(Gcld,'b',Gcld1,'r',Gcld2,'g',Gcld3,'m',20), grid on, 
legend('k = 1','k = 2','k = 3','k = 4') 
%����� ��� ��� k = 3 � 4, ������� �� ���������!
%% ���������� �������������� ������� 
figure; 
subplot(2, 2, 1)
impulse(Gcld); grid on; title('k = 1 -> �� ���������� �������');
subplot(2, 2, 2)
impulse(Gcld1); grid on; title('k = 2 -> �� ���������� �������'); 
subplot(2, 2, 3)
impulse(Gcld2); grid on; title('k = 3 -> ���������� �������'); 
subplot(2, 2, 4)
impulse(Gcld3); grid on; title('k = 4 -> ���������� �������'); 

%% �������� ������� 
% ��� ����, ����� ������������ ������� ���� ���������, ���������� � ����������, 
% ����� ��� n ������� ������������ ������� ������������ ������� ���� 
% ������������, ��� ������� A0 > 0. ��� ������ ���������� �������������� ������� 
% 
% ���������� ������� raus_gur ������ � ��������� 
% 
% �� ������������� ������������������� ��������� �������� ������������ ������� �� ���������: 
% 
% 1) �� ������� ��������� ����� ������� ������������ ��� ������������ ������������������� ��������� �� �1 �� an; 
% 
% 2) �� ������� �������� ��������� ����� � ���� ������������� ������� ������������ ���, ����� ������� ������� ������ ����; 
% 
% 3) �� ����� ������������� � ��������� ������ ���� ��� ������ n �������� ����. 
% 
% �.�. �=1 � � ����������� ������ >0, �� ������� ��������� 
[A, B, C] = raus_gur(b)