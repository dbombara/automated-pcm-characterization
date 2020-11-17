% David Bombara
clear; clc; close all;

% Initiate connection to Omnic
channel = ddeinit('OmnicApp.OmnicApp');

% Open a new window
ddeexec(channel, 'NewWindow');
ddepoke('Collect NumScans',1);
ddeexec(channel, 'AutoTune');

% Put transmittance on y-axis
ddeexec(channel, 'ChangeSeriesFormat','%transmittance');

% Get the FWHM
%ddeexec(channel, 'FWHH');

% Export data to a CSV file
ddeexec(channel, 'Export','PCM-Filter.CSV');

ddeexec(channel,'DeleteSpectrum');

% Terminate the connection with Omnic
ddeterm(channel);