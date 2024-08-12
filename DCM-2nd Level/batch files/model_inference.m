% List of open inputs
% Specify / Estimate PEB: Name - cfg_entry
% Specify / Estimate PEB: DCMs - cfg_files
nrun = X; % enter the number of runs here
jobfile = {'/Volumes/GRETA/DCM_project/GroupLevelAnalysis/model_inference_job.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(2, nrun);
for crun = 1:nrun
    inputs{1, crun} = MATLAB_CODE_TO_FILL_INPUT; % Specify / Estimate PEB: Name - cfg_entry
    inputs{2, crun} = MATLAB_CODE_TO_FILL_INPUT; % Specify / Estimate PEB: DCMs - cfg_files
end
spm('defaults', 'FMRI');
spm_jobman('run', jobs, inputs{:});
