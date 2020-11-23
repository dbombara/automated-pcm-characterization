clear all; close all; clc;
% Creating an Oscilloscope 
try
myScope = oscilloscope();
catch
    disconnect(myScope);
    clear myScope;
    myScope = oscilloscope();
end

% Discovering Available Resources
%availableResources = getResources(myScope);
availableResources = resources(myScope);

% Connecting to the Oscilloscope Object
myScope.Resource ='USB0::0x0699::0x0456::C013976::0';   
 
% Connect to the instrument.
connect(myScope);

% Examine the Current Oscilloscope Setting
get(myScope);

% Automatically configuring the instrument based on the input signal.
autoSetup(myScope);
myScope.AcquisitionTime = 1;
myScope.WaveformLength = 1000000;
myScope.TriggerMode = 'auto';
set(myScope, 'AcquisitionStartDelay',-0.001)
myScope.TriggerLevel = 1.2;
enableChannel(myScope, 'CH1');
setVerticalCoupling (myScope, 'CH1', 'DC');
setVerticalRange (myScope, 'CH1', 1.0);

% Getting a waveform from Channel 1
waveformArray = getWaveform(myScope, 'acquisition', true);

% Plot the waveform.
plot(waveformArray);
xlabel('Samples');
ylabel('Voltage');

% Cleaning up
disconnect(myScope);
clear myScope;

