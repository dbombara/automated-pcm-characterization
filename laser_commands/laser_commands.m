% Create a serial port object.
laser = instrfind('Type', 'serial', 'Port', 'COM3', 'Tag', '');
% Create the serial port object if it does not exist
% otherwise use the object that was found.
if isempty(laser)
    laser = serial('COM3');
else
    fclose(laser);
    laser = laser(1);
end
% Connect to instrument object, obj1.
fopen(laser);
% Communicating with instrument object, obj1.
data1 = query(laser, '*IDN?');

% Laser Communication Settings
set(laser, 'BaudRate',57600);
set(laser, 'StartBit',1);        % 1 start bit
set(laser,'DataBits',8);         % 8 data bits
set(laser, 'Parity','even');     % even parity
set(laser, 'StopBit',1);         % 1 stop bit
set(laser, 'FlowControl','none');% no flow control

% Laser Commands
% The command structure format is $name data<CR> where:
% • “$” is the attention command indicating a command
%   follows.
% • “name” is the command name. Commands are not
%   abbreviated, but only the first five characters are used. No
%   spaces are allowed between the $ and the name.
% • “data” is the value associated with “name”. Each
%   command dictates the type of data acceptable (string,
%   integer, floating point). There must be a space between
%   “name” and “data”. Certain commands are stand-alone and
%   do not require data.
% • “<CR>” (carriage return) indicates the end of the
%   command packet (command terminator).
% System Total On Time
writeline(laser, "HOURS <CR>"); readline(laser);
% System total HV on time
writeline(laser, "RHOURS <CR>"); readline(laser);
% System serial number
writeline(laser, "SSERIAL <CR>"); readline(laser);
% Power supply serial number
writeline(laser, "PSERIAL <CR>"); readline(laser);

% Disconnect from instrument object, obj1.
fclose(laser);
% Clean up all objects.
delete(laser);
