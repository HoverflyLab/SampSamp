%loads all the kostum konstants
function samHandles=samHandlesLoade()

%for som sort of loading of saved setings try somethings like
%if exists(savedsetings)
%then load the saved setings (probebly the whol "handle" strukture)and your
%done

%else do the foloing...
    samHandles.device = 'Dev2';         %each Nidaq-card when installed gets its own name Dev1,...,Dev100,... and so on. so far we have 3 different cards
    samHandles.deviceMan = 'nidaq';     %manufacturer of the nidaq-card all difrent daq-cards prob. uses the same initiation structure
    
    %samHandles.folderDir = 'C:\-(sampsamp)-';   %default dir for saving
    samHandles.folderDir = 'E:\';
    samHandles.folderName = '';                 %if user pick different folder, it will be stored here
    samHandles.fileNameMat = '';                %Har f�r mig att denna �r om man v�ljer ett extra namn p� filen ex Frank
    
    samHandles.fileNameData = 'data_block';     %Each data block gets a name data_block1,...,data_block20,....
    samHandles.fileNameTime = 'ticktimes_block';%to each block of data a corresponding time stamp is saved with the name ticktimes_block1,....tcktimes_block20,....
    samHandles.dataBlock = 'data_block';        %Each data block gets a name data_block1,...,data_block20,....
    samHandles.fileCounter = 1;                 %name counter of data files ex. data_block1, data_block2
    
    samHandles.stopTrigVal = 0; %condition value for stop sampling (supplied by GUI)
    samHandles.triggVal = 0;    %Condition value for start sampling (suplied by GUI)
    
    samHandles.plotFigData ={};%"pointer" to figure in which the data from brain is diplayed 
    samHandles.plotFigTrig ={};%"pointer" to figure in which the data from photo diod is diplayed

%     samHandles.sampFreq = 0;%the freaquiensy at which the data is collected (supplied by GUI)
    samHandles.sampFreq = 40000;%the freaquiensy at which the data is collected (supplied by GUI)
    samHandles.stopSize = 1000;%the amount of the latest data points that stop condition is checked against
    samHandles.aboveUnder = true;%stop trigger can see either if max(the last 160 samples)<stop condition value
                                 %                            or min(the last 160 samples)<stop condition value
    samHandles.OffTime = 0;
    samHandles.saveDir = ''; %the actual pointer to where the data is whished to be stored 

    samHandles.axisXmin = 0; %bounderies for the plotwindows
    samHandles.axisXmax = 11;
    samHandles.axisYmin = 0;
    samHandles.axisYmax = 3;
    
    samHandles.delaySamples= 0; %how many samples to store from before the start trigger
    samHandles.countOnOff = 2;  %Counter that makes sure that start button is green when sampling end red when not(that it dosent flicker)
    
    samHandles.subPlot = '1:5:end';      %plot(data(1:5:end,2)---plots every 5th sample