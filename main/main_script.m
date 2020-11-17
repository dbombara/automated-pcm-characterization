clear; clc; close all;

% FTIR Timer
filename = 'PCM-filter.CSV';
t1 = timer('TasksToExecute', 10);
t1.ExecutionMode = 'fixedRate';
t1.Period = 1;
t1.TimerFcn = {@importCSV, filename};
t1.BusyMode = 'queue';

% IR Camera Image Timer
filename = 'sample.ats';
t2 = timer('TasksToExecute', 10);
t2.ExecutionMode = 'fixedRate';
t2.Period = 1;
t2.TimerFcn = {@importIR, filename};
t2.BusyMode = 'queue';

% Start timers
start(t1);
start(t2);

% delete(t);
% Pulse the laser

% Read waveform

% Trigger the IR camera software
%com_nmbr = 'COM4';
%status = trigger(com_nmbr);

% Get FTIR metrics

% Import or calculate data from IR camera.

% Display  FTIR and IR camera data.

