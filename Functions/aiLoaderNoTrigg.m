function [handles,samHandles, ai]=aiLoaderNoTrigg(handles,samHandles,ai)




%--------------Set properties of analog input(ai)------------------
% ai=analoginput(samHandles.deviceMan,samHandles.device);


    %-------------Adds channals to ai from analogInputPanel-----------------
    a0=1;%get(handles.a0,'value');
    a1=get(handles.a1,'value');    %defoult
    a2=get(handles.a2,'value');
    a3=get(handles.a3,'value');
    a4=get(handles.a4,'value');
    a5=get(handles.a5,'value');
    a6=get(handles.a6,'value');
    a7=get(handles.a7,'value');
    
    %%**----------------when you add channels you need the number of the
    %port to sample from to activate it, under this a vector is created
    %which elements represent 
       y=[];
    for i=0:7

        if eval(sprintf('a%d',i))==1
        y(end + 1)=i;
            
%             ch=addchannel(ai,i); %You cant open the same channel more than ones

        end
    end
    ch=addchannel(ai,y);
    %%**end
    %-------------------Specific properties for trigger------------------------
if get(handles.trigOrNot,'Value')== 1
    %set (ai,'TriggerType','Software'); %Start trigger is set on software trigger
    %set(ai,'TriggerConditionValue',samHandles.triggVal);%unit[V] The TriggerConditionValue 
                                                    %is the criteria for
                                                    %when thrigger signal invoces 
                                                    %the trigger.

    set(ai,'TriggerChannel',ch(1)); %directs the software trigger to the channel 
                                %that are supose to act as a trigger signal
                                
                                

   % set(ai,'TriggerDelay',-samHandles.delaySamples);%specifies the amount of data 
                                                %that is to be saved pre trigger
                                                %in time unit [s] 
else
    set(handles.freq,'String','40000')
    set(handles.sec,'String','300') 
    samHandles.triggerBoolean = 0;
end  


    timeString = get(handles.sec,'String');
    time=str2num(timeString);
    
    sampPerTrig = samHandles.freq*time;
%     setappdata(0,'freq',samHandles.freq)
    set(ai,'SampleRate',samHandles.freq);%Sets sample rate of ai will be rounded 
                                 %off to closes possible sampling rate 
                                 %(sample rate is limite by stepsize 1/250
                                 %000 and has to be modulus 0 with it..
    
    set(ai,'SamplesPerTrigger',sampPerTrig);%Determens longest possible 
                                            %sampling time before sampsamp
                                            %considers the start trigger to
                                            %be a false one and shots it
                                            %self off
   
                                              
                                                 
%set(ai,'TimerPeriod',0.1);%stets the intervalls at which daqrealtimeplot_Callback
                           %is to be run
% set(ai,'TimerFcn',@dRTPC);%funktion to be runn whithin the 
set(ai,'TimerFcn',@dRTPC)                                             %interwall set by TriggerDelay
% set(ai,'TimerFcn',@dRTPC);                                             
set(ai,'DataMissedFcn',@missedData);%sets the funktion that is to be run when data is 
                                    %missed.
                                    
                                    