% These are all located in the Analysis directory

InitializeParameters;

workspace = [pwd filesep 'Data_' SSS num2str(resolution) '_degrees' filesep 'Data_' SSS num2str(resolution) '_degrees.mat'];

if ~exist(workspace, 'file')
    ReadVPSCData;
    CleanActivityMatrix;
    CalculateMisorientation;
    GenerateGraphics;
    save(workspace);
    disp('VPSC Analysis Complete!');
else
    load(workspace);
    GenerateGraphics;
    disp('VPSC Analysis Complete!');
end

