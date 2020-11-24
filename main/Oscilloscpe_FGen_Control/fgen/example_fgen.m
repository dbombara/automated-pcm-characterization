clear; close all; clc;

try
    myFGen = fgen();
catch
    disconnect(myFGen);
    clear myFgen;
    myFGen = fgen();
end

% Find resources. 
availableResources = resources(myFGen);

% Set the resource for the function generator you want to communicate with.
myFGen.Resource = 'USB0::0x0699::0x0456::C013976::0';

% Connect to the function generator.
connect(myFGen);

% Specify the channel name from which the function gen. produces the waveform.
selectChannel(myFGen, '1');

% Configure the function generator.
% Set the type of waveform to a sine wave.
myFGen.Waveform = 'sine';
% Set the output mode to continuous. 
myFGen.Mode = 'continuous';
% Set the load impedance to 50 Ohms. 
myFGen.OutputImpedance = 50;
% Set the frequency to 2500 Hz. 
myFGen.Frequency = 2500;
% Set the amplitude to 1.2 volts. 
myFGen.Amplitude = 1.2;
% Set the offset to 0.4 volts. 
myFGen.Offset = 0.4;

% Enable the output of signals. 
enableOutput(myFGen);

% Disable the output of signals. 
disableOutput(myFGen);

% Close the session and remove it from the workspace
disconnect(myFGen);
clear myFgen;

