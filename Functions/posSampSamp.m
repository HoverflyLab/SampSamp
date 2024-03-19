function [handles]=posSampSamp(handles,corner)
%posSampSamp moves the SampSamp figure to the top right corner of the
%screen.
%
%use of switch case:
%with >>switch someVariable; you tell matlab that you want to do different 
%things when someVariable has different values. 
%so what you do then is that you say in the case of someVariable equals 1 
%or 2 or whatever then this bit of code is going to be exequted untill a
%nother >>case or an >>end which takes you out of the switch.



switch corner    
    
    case 1 

    case 2
        set(handles.figure1,'Visible','off');
        screenSize = get(0,'ScreenSize');
        
        pos = get(handles.figure1,'position');
        outpos = get(handles.figure1,'OuterPosition');
        borders = outpos-pos;
        apsize = pos([3 4]) + borders([3 4]) + borders([1 2]);
        newPos = [screenSize(1) 36 .75*screenSize(3) .75*(screenSize(4)-62)]

        set(handles.figure1,'position',newPos);
        set(handles.figure1,'Visible','on');
        
    case 3
    case 4
end