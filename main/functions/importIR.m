function importIR(~, event, filename)
% filename = 'sample.ats'
v = FlirMovieReader(filename); %open file
[frame, ~] = step(v);
figure(1);
imshow(frame);
colormap('parula');
caxis([min(frame,[],'all') max(frame,[],'all')]);
%---------------------------------------
txt1 = ' event occurred at ';
event_type = event.Type;
event_time = datestr(event.Data.time);
msg = [event_type txt1 event_time];
disp(msg)
return