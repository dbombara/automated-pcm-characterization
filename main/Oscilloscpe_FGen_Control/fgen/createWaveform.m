function waveformArray = createWaveform

timeStep = 0.001;
time = 0:timeStep:(1-timeStep);

% Example from MathWorks video
% First Waveform
amplitude1 = 0.2;
frequency1 = 10;

% Second Waveform
amplitude2 = 0.8;
frequency2 = 14;

% Third Wavform
amplitude3 = 0.6;
frequency3 = 18;

% Sine Wave
waveform1 = amplitude1*sin(2*pi*frequency1*time);
waveform2 = amplitude2*sin(2*pi*frequency2*time);
waveform3 = amplitude3*sin(2*pi*frequency3*time);

waveform = waveform1 + waveform2 + waveform3;
waveformArray = (waveform./max(waveform))';


% % For our square wave
% timeStep = 1*10^(-6);
% time = 0:timeStep:(1-timeStep);
% % Parameters of Both Waveforms
% amplitude = 1.2; % V
% frequency = 10; % Hz
% pulseWidth = 10*10^(-6); % s
% duty = pulseWidth*frequency;
% phaseShift = 170*10^(-6); %s
% 
% % square(t, duty)
% %waveform1 = amplitude*square(time, duty)+3*amplitude;
% %waveform2 = amplitude*square(time+phaseShift, duty)3*amplitude;
% %waveform = waveform1 + waveform2;
% 

% 
% % The function generator may require a normalized waveform array.
% %waveformArray = waveform./max(waveform);
% waveformArray = waveform;
end