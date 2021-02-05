function PIDFAN

%% Acquire and analyze data from a temperature sensor

a = arduino;
fRead = 0;

figure
h = animatedline;
ax = gca;
ax.YGrid = 'on';
ax.YLim = [20 36];

stop = false;
startTime = datetime('now');
while ~stop
    % Read current voltage value
    v = readVoltage(a,'A0');
    fan = readVoltage(a, 'A1');
    
    % Calculate temperature from voltage (based on data sheet)
    TempC = (v)*100;
    if fRead == 0
        fRead = 1;
        TempPlot = TempC;
    elseif TempC > (TempPlot+0.01)
        TempPlot = TempPlot+0.01;
    elseif TempC < (TempPlot-0.01)
        TempPlot = TempPlot-0.01;
    end
        
    % Get current time
    t =  datetime('now') - startTime;
    % Add points to animation
    addpoints(h,datenum(t),TempPlot)
    % Update axes
    ax.XLim = datenum([t-seconds(15) t]);
    datetick('x','keeplimits')
    drawnow
    
    % Check stop condition
    stop = readDigitalPin(a,'D12');
end

end
