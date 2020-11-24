%clear; close all; clc;

% Instantiate an instance of the fgen.
%Resource = 'USB0::0x0699::0x0353::1915097::INSTR';
Resource = 'USB0::0x0699::0x0353::1915097::0';
Driver = 'tkafgls';
myFGen = fgen(Resource, Driver)

% Find resources. 
%availableResources = resources(myFGen)

% Set the resource for the function generator you want to communicate with.
%myFGen.Resource = 'USB0::0x0699::0x0353::1915097::INSTR'
%myFGen.Resource = 'USB0::0x0699::0x0353::1915097::0';
%myFGen.Driver = 'ivi'
%myFGen.Driver = 'tkafgls';
% Connect to the function generator.
connect(myFGen)

% Specify the channel name from which the function gen. produces the waveform.
selectChannel(myFGen, '1');

% Configure the function generator.
% Set the type of waveform to a sine wave.
myFGen.Waveform = 'Arb';

% Define the data for the arbitrary waveform
data = createWaveform;
downloadWaveform(myFGen, data);

% Enable the output of signals. 
enableOutput(myFGen);
pause(1);

% Disable the output of signals. 
disableOutput(myFGen);

% Close the session and remove it from the workspace
disconnect(myFGen);
clear myFgen;

