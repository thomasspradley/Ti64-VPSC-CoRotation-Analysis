%% Activity Matrix Clean Up
% This is accounting for the fact that we only output VPSC textures every
% other deformation step. 

% remove every other row to line up with orientation data
a_prism(2:2:41,:) = [];
a_basal(2:2:41,:) = [];
a_pyr(2:2:41,:) = [];
% add duplicate to last row for strain step #22, still at strain of 1
a_prism = [a_prism; a_prism(21,:)];
a_basal = [a_basal; a_basal(21,:)];
a_pyr = [a_pyr; a_pyr(21,:)];

% Create master activity matrix. 
activity = zeros(segments,dataSet,7);
activity(:,:,1) = a_prism;
activity(:,:,2) = a_basal;
activity(:,:,3) = a_pyr;
%activity(:,:,6) = a_mix2;
activitySum = activity;
activitySum(:,:,4) = a_prism + a_basal + a_pyr;
%basal_prism = a_prism+a_basal; %for plotting later