% List of open inputs
% Model estimation: Select SPM.mat - cfg_files
% Model estimation: Select SPM.mat - cfg_files
nrun = X; % enter the number of runs here
jobfile = {'/Volumes/GRETA/DCM_project/GroupLevelAnalysis/create_GCM_job.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(2, nrun);
for crun = 1:nrun
    inputs{1, crun} = MATLAB_CODE_TO_FILL_INPUT; % Model estimation: Select SPM.mat - cfg_files
    inputs{2, crun} = MATLAB_CODE_TO_FILL_INPUT; % Model estimation: Select SPM.mat - cfg_files
end
spm('defaults', 'FMRI');
spm_jobman('run', jobs, inputs{:});
