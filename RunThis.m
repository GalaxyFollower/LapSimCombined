%% Workings of the Combined Lapsimulator for Formula SAE Combustion and Electric
% This is the Master.
% User inputs will mainly be inputted into SetupSheets.xlsx. Toggle which
% car to run through the Lap Simulator here. Dynamic event results as well
% as points will be outputted. 

% clear all
% clc

% winopen('SetupSheets.xlsx'); %Make sure to save excel before running, you can leave it open
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%%%%%%%%%
%%%%%%%%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%%%%%%%%%
%setup = input(' Combustion or Electric? ','s');
% setup = 'Combustion';
% setup = 'Electric';
%%%%%%%%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%%%%%%%%%
%%%%%%%%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Car = CarBuilder();
%tabName = input(' Combustion or Electric? ','s');
rowNumber = 6;

Car = @()(CarBuilderSS('Combustion', rowNumber));
Track = @FSG2013;
% Track = @FSAEMichigan2015;

car = Car();
track = Track();

% [ RawResults,PointResults ] = RPMLimitingAnalysis( Car,Track );
% Simulate( car, track )
% save('BatteryandRPMLimitingAnalysis')

[Results, RawResults] = ExcelSweep(Track,7,15,'Combustion');

% scatter3(Results(:,6),Results(:,7),Results(:,1))
% surf(Results(:,6),Results(:,7),Results(:,1))
% mesh(Results(:,6),Results(:,7),Results(:,1))
% waterfall(Results(:,6),Results(:,7),Results(:,1))
% plot3(Results(:,6),Results(:,7),Results(:,1))
% Trend = cat(3,Results(:,6),Results(:,7),Results(:,1));
% Z = griddata(Results(:,6),Results(:,7),Results(:,1),x,y);
% x = min(length(Results(:,1))):0.1:length(Results(:,1));
% y = min(length(Results(:,2))):0.1:length(Results(:,2));
% Z = griddata(Results(:,6),Results(:,7),Results(:,1),x,y);

% plot(sort(Results(:,6)),sort(Results(:,1)))
% xlabel('Weight [lb]')
% ylabel('Lap Time [s]')
% axis([375 500 86.5 90])

%Cd = 0.45, Cl = -.89

WB = Results(:,6);
TrackF = Results(:,7);
timed = Results(:,1);

X = reshape(WB,3,3)';
Y = reshape(TrackF,3,3)';
Z = reshape(timed,3,3)';

surf(X,Y,Z)
xlabel('WheelBase [in]')
ylabel('Track [in]')
zlabel('Lap Time [s]')



