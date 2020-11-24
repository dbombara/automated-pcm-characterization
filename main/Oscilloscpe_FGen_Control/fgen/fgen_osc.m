clear; close all;

% Instantiate an instance of the fgen.
try
    myFGen = fgen();
    myScope = oscilloscope();
catch
    disconnect(myFGen);
    clear myFgen;
    disconnect(myScope);
    clear myScope;
    myFGen = fgen();
    myScope = oscilloscope();
end

% Find resources. 
availableResources1 = resources(myFGen);
availableResources2 = resources(myScope);

% Set the resource for the function generator you want to communicate with.
myFGen.Resource = 'USB0::0x0699::0x0456::C013976::0';
myScope.Resource ='USB0::0x0699::0x0456::C013976::0'; 

% Connect to the function generator.
connect(myFGen);
connect(myScope);

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

% Automatically configuring the instrument based on the input signal.
autoSetup(myScope);
myScope.AcquisitionTime = 1;
myScope.WaveformLength = 1000000;
myScope.TriggerMode = 'auto';
set(myScope, 'AcquisitionStartDelay',-0.001)
myScope.TriggerLevel = 1.2;
enableChannel(myScope, 'CH1');
setVerticalCoupling (myScope, 'CH1', 'DC');
setVerticalRange (myScope, 'CH1', 1.5);

% Getting a waveform from Channel 1
waveformArray = getWaveform(myScope, 'acquisition', true);

% Plot the waveform.
plot(waveformArray);
xlabel('Samples');
ylabel('Voltage');

% Disable the output of signals. 
disableOutput(myFGen);

% Close the session and remove it from the workspace
disconnect(myFGen); disconnect(myScope);
clear myFgen myScope

