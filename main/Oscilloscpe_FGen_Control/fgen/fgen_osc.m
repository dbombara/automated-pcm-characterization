clear; close all;

% Instantiate an instance of the fgen.
try
    myScope = oscilloscope();
catch
    disconnect(myScope);
    clear myScope;
    myScope = oscilloscope();
end

% Find resources. 
availableResources = resources(myScope);

% Set the resource for the function generator you want to communicate with.
myScope.Resource = 'USB0::0x0699::0x0456::C013976::INSTR';

% Connect to the function generator.
connect(myScope);

% Specify the channel name from which the function gen. produces the waveform.
selectChannel(myScope, '1');

% Configure the function generator.
% Set the type of waveform to a sine wave.
myScope.Waveform = 'sine';
% Set the output mode to continuous. 
myScope.Mode = 'continuous';
% Set the load impedance to 50 Ohms. 
myScope.OutputImpedance = 50;
% Set the frequency to 2500 Hz. 
myScope.Frequency = 2500;
% Set the amplitude to 1.2 volts. 
myScope.Amplitude = 1.2;
% Set the offset to 0.4 volts. 
myScope.Offset = 0.4;

% Enable the output of signals. 
enableOutput(myScope);

% Automatically configuring the instrument based on the input signal.
autoSetup(myScope);
myScope.AcquisitionTime = 1;
myScope.WaveformLength = 1000000;
myScope.TriggerMode = 'auto';
set(myScope, 'AcquisitionStartDelay',-0.001)
myScope.TriggerLevel = 1.2;
enableChannel(myScope, 'CH1');
setVerticalCoupling (myScope, 'CH1', 'DC');
setVerticalRange (myScope, 'CH1', 1.7);

% Getting a waveform from Channel 1
waveformArray = getWaveform(myScope, 'acquisition', true);

% Plot the waveform.
plot(waveformArray);
xlabel('Samples');
ylabel('Voltage');

% Disable the output of signals. 
disableOutput(myScope);

% Close the session and remove it from the workspace
disconnect(myScope);
clear myScope

