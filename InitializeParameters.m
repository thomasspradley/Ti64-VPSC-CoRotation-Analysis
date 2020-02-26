%% Add Dependency Folders to Matlab Path
% Path addition with addpath only adds to the path for the current Matlab
% session.

addpath(genpath([pwd filesep 'Analysis']));
addpath(genpath([pwd filesep 'ExternalTools']));

%Slip System Scheme
SSS = 'Iso';

%% Set Crystal Symmetries for alpha and beta phases

CSa = crystalSymmetry('622', [2.95 2.95 4.68], 'X||a', 'Y||b*', 'Z||c', 'color', 'light blue');
CSb = crystalSymmetry('432', [3.24 3.24 3.24], 'mineral', 'Titanium - Beta', 'color', 'light green');

SS = specimenSymmetry('-1');

%Preset Starting Orientations
ori_a0 = orientation('Euler',135*degree,90*degree,325*degree,CSa);
ori_b0 = orientation('Euler',0*degree,0*degree,0*degree,CSb);

% Number of strain states in str_str file
segments = 22;

%If ODF is used instead of deterministic approach
%psi = deLaValeePoussinKernel('halfwidth',5*degree);

%% Generate all loading directions
% In reality, what I am doing is generating rotation matrices to be applied
% to the initial orientation, *not* actually generating a bunch of loading
% directions. 

%Set number of degrees between each data point in hemisphere.
% 333 rotations  = 10
% 915 rotations  = 6
% 1387 rotations = 5
% 2093 rotations = 4

resolution = 6; %degrees Basically if u wanna do either iso 10 or 90 file

r = plotS2Grid('resolution',resolution*degree,'upper');
%r = equispacedS2Grid('resolution', resolution*degree, 'upper');

rot  = rotation('map',zvector,r);
rot2 = rotation('map',r,zvector);

dataSet = length(r(:));

%% Initialize matrices to run faster later
if SSS=='Iso'
    a_prism = zeros(41,dataSet);
    a_basal = zeros(41,dataSet);
    a_pyr = zeros(41,dataSet);
    
elseif SSS=='7SS'
    a_prism1 = zeros(41,dataSet);
    a_prism2 = zeros(41,dataSet);
    a_prism3 = zeros(41,dataSet);
    a_basal1 = zeros(41,dataSet);
    a_basal2 = zeros(41,dataSet);
    a_basal3 = zeros(41,dataSet);
    a_pyr = zeros(41,dataSet);
else
    fprintf( "input something under a file that exists")
end 
%a_mix2 = zeros(41,dataSet);

%% Initialize Color Maps

white2red  = customcolormap([0 1], {'#ff0000', '#ffffff'});
white2blue = customcolormap([0 1], {'#0000ff', '#ffffff'});
