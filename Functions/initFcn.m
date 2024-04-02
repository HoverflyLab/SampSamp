% Initialises default settings of the SampSamp application
function init = initFcn()

    init.device = 'Dev2';         %each Nidaq-card when installed gets its own name Dev1,...,Dev100,... and so on. so far we have 3 different cards
    init.deviceMan = 'nidaq';     %manufacturer of the nidaq-card all difrent daq-cards prob. uses the same initiation structure
    
    %samHandles.folderDir = 'C:\-(sampsamp)-';   %default dir for saving
    init.folderDir = 'E:\';
    init.folderName = '';                 %if user pick different folder, it will be stored here
    init.fileNameMat = '';                %Har f�r mig att denna �r om man v�ljer ett extra namn p� filen ex Frank
    
    init.fileNameData = 'data_block';     %Each data block gets a name data_block1,...,data_block20,....
    init.fileNameTime = 'ticktimes_block';%to each block of data a corresponding time stamp is saved with the name ticktimes_block1,....tcktimes_block20,....
    init.dataBlock = 'data_block';        %Each data block gets a name data_block1,...,data_block20,....
    init.fileCounter = 1;                 %name counter of data files ex. data_block1, data_block2
    
    init.stopTrigVal = 0; %condition value for stop sampling (supplied by GUI)
    init.triggVal = 0;    %Condition value for start sampling (suplied by GUI)
    
    init.plotFigData ={};%"pointer" to figure in which the data from brain is diplayed 
    init.plotFigTrig ={};%"pointer" to figure in which the data from photo diod is diplayed

%     samHandles.sampFreq = 0;%the freaquiensy at which the data is collected (supplied by GUI)
    init.sampFreq = 40000;%the freaquiensy at which the data is collected (supplied by GUI)
    init.stopSize = 1000;%the amount of the latest data points that stop condition is checked against
    init.aboveUnder = true;%stop trigger can see either if max(the last 160 samples)<stop condition value
                                 %                            or min(the last 160 samples)<stop condition value
    init.OffTime = 0;
    init.saveDir = ''; %the actual pointer to where the data is whished to be stored 

    init.axisXmin = 0; %bounderies for the plotwindows
    init.axisXmax = 11;
    init.axisYmin = 0;
    init.axisYmax = 3;
    
    init.delaySamples= 0; %how many samples to store from before the start trigger
    init.countOnOff = 2;  %Counter that makes sure that start button is green when sampling end red when not(that it dosent flicker)
    
    init.subPlot = '1:5:end';      %plot(data(1:5:end,2)---plots every 5th sample