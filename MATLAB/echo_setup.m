
%% Adaptive Echo Cancellation - Signal Setup
clear;
clc;
close all;

%% Sampling settings
muStep = 0.3;
fs = 8000;
T = 5;
t = (0:fs*T)'/fs;

%% Generate far-end reference signal
rng(41);
farSig = filter(1, [1 -0.72], randn(numel(t), 1));
farSig = 0.12 * farSig / rms(farSig);

%% Simulated room echo path
hEcho = zeros(1, 256);
hEcho([129 161 193]) = [0.55 0.23 0.10];

%% Generate near-end test signal
gate = (t >= 2 & t < 3) | (t >= 4 & t < 4.4);

nearSig = gate .* ( ...
    0.035*sin(2*pi*233*t) + ...
    0.019*sin(2*pi*457*t));

%% Simulated microphone noise
noiseSig = 0.001 * randn(numel(t), 1);

%% Create Simulink input timeseries
farTS = timeseries(farSig, t);
nearNoiseTS = timeseries(nearSig + noiseSig, t);

%% Display verification
fprintf('Sampling rate: %d Hz\n', fs);
fprintf('Duration: %.1f seconds\n', T);
fprintf('Number of samples: %d\n', numel(t));
fprintf('Echo path length: %d taps\n', numel(hEcho));

whos farTS nearNoiseTS hEcho farSig nearSig noiseSig
 
%% Input Waveform Visualization

figure('Name','AEC Input Waveforms');

figure(1);

subplot(3,1,1);
builtin('plot',t,farSig);
grid on;
title('Far-End Reference Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(3,1,2);
builtin('plot',t,nearSig);
grid on;
title('Near-End Speech Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(3,1,3);
builtin('plot',t,nearNoiseTS.Data);
grid on;
title('Near-End Signal + Noise');
xlabel('Time (s)');
ylabel('Amplitude');
