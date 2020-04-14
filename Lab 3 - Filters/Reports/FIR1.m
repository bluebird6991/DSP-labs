%### 2 ������� ###%
function Hd = FIR1
%FIR1 Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 9.5 and DSP System Toolbox 9.7.
% Generated on: 14-Apr-2020 10:04:34

% Equiripple Lowpass filter designed using the FIRPM function.

% All frequency values are in Hz.
Fs = 125;  % Sampling Frequency

Fpass = 40;              % Passband Frequency
Fstop = 45;              % Stopband Frequency
Dpass = 0.057501127785;  % Passband Ripple
Dstop = 0.0001;          % Stopband Attenuation
dens  = 20;              % Density Factor

% Calculate the order from the parameters using FIRPMORD.
[N, Fo, Ao, W] = firpmord([Fpass, Fstop]/(Fs/2), [1 0], [Dpass, Dstop]);

% Calculate the coefficients using the FIRPM function.
b  = firpm(N, Fo, Ao, W, {dens});
Hd = dfilt.dffir(b);

Ts = 0 : 1/Fs : 15 - 1/Fs;
N = length(Ts);

f1 = 30; 
f2 = 40;
f3 = 50;
f4 = 60;

x = 0.5*sin(2*pi*f1*Ts) + ...
    0.65*sin(2*pi*f2*Ts) + ...
    0.8*sin(2*pi*f3*Ts) + ...
    0.95*sin(2*pi*f4*Ts);

subplot(2, 2, 1);
plot(x); hold on; title('�������� ������');
xlabel('�����'); ylabel('���������');
X = abs(fft(x));
Xm = 2*abs(X)/N;
subplot(2, 2, 2);
plot(X, Xm); grid on; title('��� ��������� �������');
xlabel('�������'); ylabel('���������');

y = filter(Hd, x);
X = abs(fft(y));

subplot(2, 2, 3);
plot(y); grid on; title('�������������� ������');
xlabel('�����'); ylabel('���������');
Xm = 2 * abs(X) / N;
X = (0: N - 1) * Fs / N;
subplot(2, 2, 4);
plot(X, Xm); grid on; title('��� ���������������� �������');
xlabel('�������'); ylabel('���������');