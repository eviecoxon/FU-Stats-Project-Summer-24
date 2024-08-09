% Specify SPM and data paths
spm_path = '/Users/canbolat/Desktop/spm12'; % Path to SPM folder
data_folder_path = '/Users/canbolat/Desktop/stats_project/data'; % Root path of the data

% Add paths
addpath(spm_path)
spm('defaults', 'fmri')
spm_jobman('initcfg')

% List of subjects to process
subject_list = {'sub-002', 'sub-003', 'sub-004', 'sub-007', 'sub-009', 'sub-010'};

% Loop through each subject and perform model comparison
for i = 1:numel(subject_list)
    subject = subject_list{i}; % Get the current subject ID
    
    % Define DCM files for the current subject
    dcm_folder_path = fullfile(data_folder_path, subject, 'DCM');
    dcm_files = {
        %fullfile(dcm_folder_path, 'DCM_full_model.mat'),
        fullfile(dcm_folder_path, 'DCM_m1_no_imagery.mat'),
        fullfile(dcm_folder_path, 'DCM_m2_forward_imagery.mat'),
        fullfile(dcm_folder_path, 'DCM_m3_backwards_imagery.mat'),
        fullfile(dcm_folder_path, 'DCM_m4_backward_imag_forward_stim.mat')
    };
    
    % Define batch for model comparison
    matlabbatch = [];
    matlabbatch{1}.spm.dcm.bms.inference.dir = {data_folder_path}; % Output directory
    matlabbatch{1}.spm.dcm.bms.inference.sess_dcm{1}.dcmmat = dcm_files; % DCM files for the current subject
    matlabbatch{1}.spm.dcm.bms.inference.model_sp = {''};
    matlabbatch{1}.spm.dcm.bms.inference.load_f = {''};
    matlabbatch{1}.spm.dcm.bms.inference.method = 'FFX'; % Fixed effects
    matlabbatch{1}.spm.dcm.bms.inference.family_level.family_file = {''};
    matlabbatch{1}.spm.dcm.bms.inference.bma.bma_no = 0;
    matlabbatch{1}.spm.dcm.bms.inference.verify_id = 1;
    
    % Run the batch job
    spm_jobman('run', matlabbatch);
    
    disp(['Model comparison completed for ', subject]);
end

disp('All model comparisons completed.');
