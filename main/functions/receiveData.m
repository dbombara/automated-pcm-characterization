function [lambda, T] = importCSV(~, event, filename)
A = readmatrix(filename);
lambda = A(:,1);
T = A(:,2); % transmittance

txt1 = ' event occurred at ';
%txt2 = string_arg;

event_type = event.Type;
event_time = datestr(event.Data.time);

msg = [event_type txt1 event_time];
disp(msg)
return