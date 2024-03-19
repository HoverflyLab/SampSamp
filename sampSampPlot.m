function [handles, samHandles] = sampSampPlot(handles, samHandles, num, posi)

screenSize = get(0,'screensize');

posSampSamp = get(handles.figure1,'Position');
outerPosSampSamp = get(handles.figure1, 'OuterPosition');

borderSampSamp = outerPosSampSamp - posSampSamp;
sampSampSize = outerPosSampSamp - posSampSamp;

sampSampSize = outerPosSampSamp([3 4]/2);

sizeLeftForPlot = [(screenSize(3) - sampSampSize(1)) screenSize(4)*0.9];

samHandles.plotFigur(num)=figure('Visible','off');

pos = get(samHandles.plotFigur(num),'position');
outerPos = get(samHandles.plotFigur(num),'OuterPosition');

borders = outerPos - pos;
outerHight = sizeLeftForPlot(2)/2;
outerWhiths = sizeLeftForPlot(1);

newPos =   [(borders(3)/2) ...
            (screenSize(4) - outerHight + borders(3)/2 +1) ...
            (outerWhiths - borders(2)) ...
            (outerHight - borders(4))];
samHandles.plotFigDataAxis = axes;
    axis (samHandles.plotFigDataAxis, ...
          [samHandles.axisXmin samHandles.axisXmax samHandles.axisYmin samHandles.axisYmax])
set(samHandles.plotFigur(num), 'Position',newPos);