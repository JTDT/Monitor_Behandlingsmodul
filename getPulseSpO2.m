%function getPulseSpO2(src,~)
% The function collects data from Arduino Uno R3 by reading
% from computer port.
% heartRate = pulse/heart rate (heart beats per minute)
% SpO2 = oxygen saturation in blood vessels
% serialObj = serial port object
% HR_handle = handle to heart rate label on GUI
% SpO2_handle = handle to oxygen saturation label on GUI
% Get pulse and O2 saturation

% Make call asynchron
% OBS: fscanf is a syncron call and will block the command window until
% all operations is done - making it asyncron will make it run back

bioData = split(rawData,':'); % splits data -> HR:SpO2:Conficence:Status:[array]
bioData = str2double(bioData);
disp(datetime('now'));

% Check confidence is over 95% and status of finger detected (equals 3)
if bioData(3)>= 95 && bioData(4)==3
    heartRate = num2str(bioData(1))
    spO2 = num2str(bioData(2))
else
    disp('Finger detection error. Try replace finger')
end

end








