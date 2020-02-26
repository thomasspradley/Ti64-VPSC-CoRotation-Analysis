%% Import mode activity for Ti project (basal, prism, 1st order pyr)

function [activity,a_prism,a_basal,a_pyr]= importACT_TiIso(pname,phaseID)

%read raw text
data = importdata([pname '\ACT_PH' num2str(phaseID) '.OUT']);

%parse out the bit we want
activity = data.data(:,3:5);

% separate into separate slip systems
a_prism = activity(:,1);
a_basal = activity(:,2);
a_pyr = activity(:,3);