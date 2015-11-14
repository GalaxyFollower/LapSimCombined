function [ Track ] = FSAELincoln2013( )
%FSAE 2015 Michigan Endurance Track
%   View Solidworks Part: "FSAE Map Michigan 2015_Schraeger.SLDPRT" for
%   measurements
%   The defined track matches the race line data generated by Reiley
%   Schraeger
%   of www.fsaesim.com
%   http://students.sae.org/cds/formulaseries/fsae/autocross2015.pdf
%   Reiley Schraeger / lamborghinidoor@yahoo.com

%   Defines section data, one straight section followed by several curved sections.

SectionMatrix = [

    270.17,	0
    779.62,	916.65
    227.06,	228.96
    253.7,	256.74
    267.55,	270.85
    632.44,	633.03
    342.83,	342.92
    1629.23,	0
    308.07,	309.09
    449.99,	450.65
    201.6,	201.75
    324.87,	327.62
    708.83,	716.64
    436.39,	439.03
    403.94,	0
    388.45,	392.41
    442.9,	0
    322,	326.8
    542.16,	0
    435.14,	439.77
    430.43,	0
    302.27,	305.11
    557.94,	585.84
    304.34,	307.95
    323.91,	325.27
    823.75,	823.91
    1890.15,	0
    702.42,	703.42
    251.1,	323.17
    546.38,	557.59
    552.31,	0
    456.15,	464.32
    512.12,	0
    473.29,	476.95
    385.02,	0
    223.73,	224.87
    621.63,	0
    312.34,	314.87
    594.69,	626.02
    615.73,	673.09
    407.57,	424.07
    317.29,	0
    192.03,	195.01
    493.12,	0
    487.94,	490.84
    797.39,	0
    379.88,	384.26
    295.49,	296.49
    501.71,	506.21
    761.02,	763.25
    350.84	352.03
    464.14,	471.69
    352.9,	366.71
    344.7,	349.41
    414.62,	422.76
    191.59,	192.07
    504.62,	505.22
    1161.09, 1162.13
    1363.83, 0
    356.29,	356.53
    505.51,	506.57
    426.85,	0
    427.51,	438.11
    287.07,	292.41
    268.93,	370.62
    362.21,	367.37
    288.93,	294.05
    335.45,	342.29
    197.76,	207.31
    706.29,	0
    740.55,	748.65
    328.42,	331.49
    330.38,	0
    390.53,	394.56
    436.68,	441.59
    388.94,	396.66
    458.15,	459.67
    440.79,	449.95
    751.17,	755.48
    489.1,	0
    203.94,	208.11
    579.85,	592.55
    696.12,	747.87
    468.46,	0

    ]; % inches  [Length,Radius (O represents a straight)]


N = length(SectionMatrix);

% Builds array of TrackSection objects
for i=1:N
    if SectionMatrix(i,2)
        Length = SectionMatrix(i,1);
        Radius = SectionMatrix(i,2);
        TS = TrackSection(Length,Radius,i);
        TSArray(i) = TS;
    else
        Length = SectionMatrix(i,1);
        TS = TrackSection(Length,0,i);
        TSArray(i) = TS;
    end
end

% Calls TestTrack Constructor
Track = TestTrack(TSArray);


end


