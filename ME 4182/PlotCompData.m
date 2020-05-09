%% Capstone Data Plotting
%This program takes in a file folder of path of raw data collected from 
%compression testing in the MILL and plots the data for Capstone
%
%Author: Ashley Eggart
%Class: ME 4182
%Date: 3/12/2020

%Need to update the below code to find csv files in the correct data folder
%and split the name to seperate the mortar and cement trials and graph them
%appropriately.

clear; clc;
concrete= struct;
mortar = struct;
mixed = struct;
ults = [];

%Dimesnsions
v3_height = 105.01;     % mm
v3_width = 94.14;       % mm
v3_thick = 18;          % mm
v3_area = v3_height * v3_width; 
v3_vol = 178.6;         % mL

v4_side = 25.23;        % mm
v4_thick = 6.55;        % mm
v4_area = v4_side ^ 2; 

% Properties of AlO2
alo2_dens = 3.69;       %gm/cc
alo2_YM = 300;          %GPa
%alo2_compStrength =

%% Read data with consistent data and name format from all xlsx files in a folder
%Code for reading in files from a given path directory was acquired from
%the below website
%https://matlab.fandom.com/wiki/FAQ#How_can_I_process_a_sequence_of_files.3F

%Specify folder where files are located- need to update to correct folder
%path
myFolder = 'C:\Users\nvga\Documents\College\Spring 2020\ME 4182\Raw Data';

% Get a list of all files in the folder with the desired file name pattern.
filePattern = fullfile(myFolder, '*.csv');
csvFiles = dir(filePattern);
for k = 1 : length(csvFiles)   %For every .csv file 
    %Create the complete file name
    baseFileName = csvFiles(k).name;
    fullFileName = fullfile(myFolder, baseFileName);
    fprintf(1, 'Now reading %s\n', fullFileName);
    %Split the filename into its relevant parts 
    C = strsplit(baseFileName, '.');%Splits name and file extension
    name = C{1};
    if(length(name) == 10)
        material = name(3);%Get the letter for material
        if(strcmp(material, "m"))%Mortar
            mortar(end+1).Data = readtable(baseFileName,'HeaderLines',2);
            mortar(end).name = name;
            mortar(end).Mold = name(1:2);
            mortar(end).MatVs = name(3:4);
            mortar(end).Release = name(5:6);
            mortar(end).Seal = name(7:8);
        elseif(strcmp(material, "c"))%Concrete
            concrete(end+1).Data = readtable(baseFileName,'HeaderLines',2);
            concrete(end).name = name;
            concrete(end).Mold = name(1:2);
            concrete(end).MatVs = name(3:4);
            concrete(end).Release = name(5:6);
            concrete(end).Seal = name(7:8);
        end
    else
        material = name(3:4);
        if(strcmp(material, "cm"))%Concrete Mortar Mixed
            mixed(end+1).Data = readtable(baseFileName,'HeaderLines',2);
            mixed(end).name = name;
            mixed(end).Mold = name(1:2);
            mixed(end).MatVs = name(3:5);
            mixed(end).Release = name(6:7);
            mixed(end).Seal = name(8:9);
        end
    end
end
concrete(1) = [];
mortar(1) = [];
mixed(1) = [];
%% Plot the Mortar Data
figure();
hold on; grid on; box on;
for k = 1 : length(mortar)
    %Extract relevant data and make sure it is the right data type
    if(isa(mortar(k).Data{:,2},'cell'))
        disp = str2double(mortar(k).Data{:,2});
        force = str2double(mortar(k).Data{:,3});
    else
        disp = mortar(k).Data{:,2};
        force = mortar(k).Data{:,3};
    end
    %Zero out displacement 
    if(disp(1) ~= 0)
        disp = disp - disp(1);
    end
    %Convert to Stress and strain- should update to vary area based on mold
    %type
    stress = (force/v3_area)*10^6; %kPa
    strain = disp/v3_thick; %Unitless
    ults = [ults, max(stress)];
    
    plot(strain, stress);
end
%Format Plot
xlabel('Strain'); ylabel('Stress [kPa]'); % Label axis with variables and UNITS
title('Mortar Data'); % Add title to figure
leg = extractfield(mortar, 'name');
legend(leg);
%% Plot the Concrete Data
%Concrete
figure();
hold on; grid on; box on;
for k = 1 : length(concrete)
    %Extract relevant data
    if(isa(concrete(k).Data{:,2},'cell'))
        disp = str2double(concrete(k).Data{:,2});
        force = str2double(concrete(k).Data{:,3});
    else %if it is a double
        disp = concrete(k).Data{:,2};
        force = concrete(k).Data{:,3};
    end
    %Zero out displacement 
    if(disp(1) ~= 0)
        disp = disp - disp(1);
    end   
    %Convert to Stress and strain
    stress = (force/v3_area)*10^6; %kPa
    strain = disp/v3_thick; %Unitless
    ults = [ults, max(stress)];
    
    plot(strain, stress);
end

%Format Plot
xlabel('Strain'); ylabel('Stress [kPa]'); % Label axis with variables and UNITS
title('Concrete Data'); % Add title to figure
leg = extractfield(concrete, 'name');
legend(leg);

%% Plot the Mixed Data
%Concrete and Mortar Mixture Data
figure();
hold on; grid on; box on;
for k = 1 : length(mixed)
    %Extract relevant data
    if(isa(mixed(k).Data{:,2},'cell'))
        disp = str2double(mixed(k).Data{:,2});
        force = str2double(mixed(k).Data{:,3});
    else %if it is a double
        disp = mixed(k).Data{:,2};
        force = mixed(k).Data{:,3};
    end
    %Zero out displacement 
    if(disp(1) ~= 0)
        disp = disp - disp(1);
    end   
    %Convert to Stress and strain
    stress = (force/v4_area)*10^6; %kPa
    strain = (disp/v4_thick); %Unitless
    ults = [ults, max(stress)];
    
    plot(strain, stress);
end

%Format Plot
xlabel('Strain'); ylabel('Stress [kPa]'); % Label axis with variables and UNITS
title('Concrete and Mortar Mixture Data'); % Add title to figure
leg = extractfield(mixed, 'name');
legend(leg);

%% Hardness Tests and Plots
HardData = readtable('HardnessData.xlsx');
names = HardData{:,1};
vickers = HardData{:,2};
rockwell = str2double(HardData{:,3});
X = categorical(names);
X = reordercats(X,names);

figure();
b = bar(X, vickers);
b.FaceColor = 'flat';
b.CData(1,:) = [0.85 0.3 0.1];
b.CData(2,:) = [0.85 0.3 0.1];
b.CData(3,:) = [0.85 0.3 0.1];
b.CData(4,:) = [1 0.84 0];

hold on;
% colors -- desired color for each type/class
colors=[[0.85 0.3 0.1]; ...                         % Red for concrete
        [1 0.84 0]; ...                             % Yellow for mortar
        [0 0.45 0.74]];                             % Blue for mixed
nColors=size(colors,1);                             % make variable so can change easily
labels={'Concrete';'Mortar';'Mixed'};
hBLG = bar(nan(2,nColors));         % the bar object array for legend
for i=1:nColors
  hBLG(i).FaceColor=colors(i,:);
end
hLG=legend(hBLG,labels,'location','best');
ylabel('Vickers Hardness');
title('Hardness Comparison Tests');

%% Density Plots
DenData = readtable('DensityData.xlsx');
DenNames = DenData{:,1};
mass = DenData{:,2};
vol = DenData{:,3};
X = categorical(DenNames);
X = reordercats(X,DenNames);

expirVol = mass./vol;
therVol = mass./v3_vol;

plotVol = [expirVol, therVol];

figure();
b = bar(X, plotVol);
hLG=legend('Experimental','Theoretical','location','best');
ylabel('Density [g/mL]');
title('Experimental and Theoretical Density');

%% Young's Modulus
YMData = readtable('YMData.xlsx');%,'HeaderLines',1);
YMNames = YMData{:,1};
YM = YMData{:,2};
X = categorical(YMNames);
X = reordercats(X,YMNames);

figure();
b = bar(X, YM);
b.FaceColor = 'flat';
b.CData(1,:) = [0.85 0.3 0.1];
b.CData(2,:) = [0.85 0.3 0.1];
b.CData(3,:) = [0.85 0.3 0.1];
b.CData(4,:) = [0.85 0.3 0.1];
b.CData(5,:) = [1 0.84 0];
b.CData(6,:) = [1 0.84 0];
b.CData(7,:) = [1 0.84 0];
b.CData(8,:) = [1 0.84 0];

hold on;
% colors -- desired color for each type/class
colors=[[0.85 0.3 0.1]; ...                         % Red for concrete
        [1 0.84 0]; ...                             % Green for mortar
        [0 0.45 0.74]];                             % Blue for mixed
nColors=size(colors,1);                             % make variable so can change easily
labels={'Concrete';'Mortar';'Mixed'};
hBLG = bar(nan(2,nColors));         % the bar object array for legend
for i=1:nColors
  hBLG(i).FaceColor=colors(i,:);
end
hLG=legend(hBLG,labels,'location','best');

ylabel('Young''s Modulus [MPa]');
title('Young''s Modulus Comparison');

%% Ultimate Strength
figure();
b = bar(ults);
ylabel('Ultimate Strength [kPa]');
title('Ultimate Strength Comparison');
