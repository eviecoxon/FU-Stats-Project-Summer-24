% initializing SPM
spm_path = '/Users/greta/Desktop/spm12'; % Enter the path of your SPM folder

% set local data path
data_folder_path = '/Volumes/GRETA/DCM_project'; % Enter the root path of where your data is stored

% add paths
addpath(spm_path)
addpath(data_folder_path)

spm('defaults', 'fmri')
spm_jobman('initcfg')

% specifying data, participant and run paths
subject_folder = {'sub-002', 'sub-004', 'sub-007', 'sub-009', 'sub-010'};
run_folder = {'run-01'};
%% Specify DCM Models
% SPECIFICATION DCMs "attentional modulation of backward/forward connection"
%--------------------------------------------------------------------------
% To specify a DCM, you might want to create a template one using the GUI
% then use spm_dcm_U.m and spm_dcm_voi.m to insert new inputs and new
% regions. The following code creates a DCM file from scratch, which
% involves some technical subtleties and a deeper knowledge of the DCM
% structure.
for j = 1:numel(subject_folder) % for loop from 1 to number of elements in folder_sub

    S = []; % init empty structure
    S.data_folder_path = data_folder_path; % add data folder path
    S.subject_folder = subject_folder{j}; % add subject path
    
    glm_folder_path = fullfile(S.data_folder_path, S.subject_folder, 'GLM');     % defining GLM folder path
    specified_glm = spm_select('FPList', glm_folder_path, '^SPM.mat$');

    VOI_folder_path = fullfile(S.data_folder_path, S.subject_folder, 'VOI');     % defining VOI folder path

    DCM_folder_path = fullfile(S.data_folder_path, S.subject_folder, 'DCM');     % defining DCM folder path
    if ~exist(DCM_folder_path, 'dir')     % Check if the 'DCM' folder does not exist
        mkdir(DCM_folder_path);      % Create the 'DCM' folder
    else
        disp('DCM folder already exists.');
    end

load(fullfile(glm_folder_path,'SPM.mat'));

% Load regions of interest
%--------------------------------------------------------------------------
load(fullfile(VOI_folder_path,'VOI_rBA2_1.mat'),'xY');
DCM.xY(1) = xY;
load(fullfile(VOI_folder_path,'VOI_left_temporal_pole_1.mat'),'xY');
DCM.xY(2) = xY;
load(fullfile(VOI_folder_path,'VOI_right_insula_1.mat'),'xY');
DCM.xY(3) = xY;

DCM.n = (length(DCM.xY));      % number of regions
DCM.v = (length(DCM.xY(1).u)); % number of time points

% Time series
%--------------------------------------------------------------------------
DCM.Y.dt  = 2;
DCM.Y.X0  = DCM.xY(1).X0;
for i = 1:DCM.n
    DCM.Y.y(:,i)  = DCM.xY(i).u;
    DCM.Y.name{i} = DCM.xY(i).name;
end

DCM.Y.Q    = spm_Ce(ones(1,DCM.n)*DCM.v);

% Experimental inputs
%--------------------------------------------------------------------------
% Set the time interval (assuming all sessions have the same dt)
SPM.Sess(1).U(1).dt
% Concatenate input names from all sessions
DCM.U.name = {'Stimulation', 'Imagery', 'Task'}; % Ensure names are correctly concatenated

% Concatenate input values from all sessions, using the entire matrix
DCM.U.u = [SPM.Sess(1).U(1).u; ...
           SPM.Sess(1).U(2).u; ...
           SPM.Sess(1).U(3).u];

% DCM parameters and options
%--------------------------------------------------------------------------
DCM.delays = [1;1;1];
DCM.TE     = 0.03; % Define TE (3000ms)

DCM.options.nonlinear  = 0; % Bilinear modulation
DCM.options.two_state  = 0; % One-state
DCM.options.stochastic = 0; % No stochastic effects
DCM.options.centre = 0;
DCM.options.induced = 0;

% Connectivity matrices for full model
%--------------------------------------------------------------------------
% A-matrix (connectivity)
DCM.a = [1,1,1;1,1,0;1,0,1];
% B-matrix (modulation)
DCM.b(:,:,1) = [0,1,1;1,0,0;1,0,0];
DCM.b(:,:,2) = [0,1,1;1,0,0;1,0,0];
DCM.b(:,:,3) = [0,0,0;0,0,0;0,0,0];
% C-matrix (input effects)
DCM.c = [1,0,0;1,0,0]';
% D-matrix (non-linear effects)
DCM.d = zeros(3,3,0);

save(fullfile(DCM_folder_path,'DCM_full_model.mat'),'DCM');

% %  Connectivity matrices for forward no imagery modulation model
% %--------------------------------------------------------------------------
DCM.a = [1,1,1;1,1,0;1,0,1];
DCM.b = zeros(3,3,3); % No modulation
DCM.b(1,2,1) = 1 % rBA2 to left temporal pole stimulation modulation
DCM.b(1,3,1) = 1 % rBA2 to right insula stimulation modulation
DCM.b(2,1,1) = 1 % right insula to rBA2 stimulation modulation
DCM.b(3,1,1) = 1 % left temporal pole to rBA2 stimulation modulation

DCM.c = [0, 0, 1;  % Task driving input affects rBA2
         0, 0, 0; 
         0, 0, 0]; 

 save(fullfile(DCM_folder_path,'DCM_m1_forward_no_imagery.mat'),'DCM');
% 
% %  Connectivity matrices for forward model of imagery
% %--------------------------------------------------------------------------
DCM.a = [1,1,1;1,1,0;1,0,1];
DCM.b = zeros(3,3,3);
DCM.b(1,2,1) = 1 % rBA2 to left temporal pole stimulation modulation
DCM.b(1,3,1) = 1 % rBA2 to right insula stimulation modulation
DCM.b(2,1,1) = 1 % right insula to rBA2 stimulation modulation
DCM.b(3,1,1) = 1 % left temporal pole to rBA2 stimulation modulation
DCM.b(1,2,2) = 1; % rBA2 to left temporal pole imagery modulation
DCM.b(1,3,2) = 1; % rBA2 to right_insula imagery modulation


DCM.c = [0, 0, 1;  % Driving input 3 affects `rBA2`
         0, 0, 0;  % No input to `left_temporal_pole`
         0, 0, 0]; % No input to `right_insula`
% 
 save(fullfile(DCM_folder_path,'DCM_m2_forward_imagery.mat'),'DCM');
% 
%  %  Connectivity matrices for backwards model of imagery
% %--------------------------------------------------------------------------
DCM.a = [1,1,1;1,1,0;1,0,1];
DCM.b = zeros(3,3,3);
DCM.b(1,2,1) = 1 % rBA2 to left temporal pole stimulation modulation
DCM.b(1,3,1) = 1 % rBA2 to right insula stimulation modulation
DCM.b(2,1,1) = 1 % right insula to rBA2 stimulation modulation
DCM.b(3,1,1) = 1 % left temporal pole to rBA2 stimulation modulation
DCM.b(2,1,2) = 1; % left temporal pole to rBA2 imagery modulation
DCM.b(3,1,2) = 1; % right insula to rBA2 imagery modulation


DCM.c = [0, 0, 0;  % No input to `rBA2`
         0, 0, 1;  % Driving input to `left_temporal_pole`
         0, 0, 1]; % Driving input to `right_insula`
% 
 save(fullfile(DCM_folder_path,'DCM_m3_backwards_imagery.mat'),'DCM');

%  %  Connectivity matrices for backwards imagery and forward stimulation
% %--------------------------------------------------------------------------
DCM.a = [1,1,1;1,1,0;1,0,1];
DCM.b = zeros(3,3,3);
DCM.b(1,2,1) = 1 % rBA2 to left temporal pole stimulation modulation
DCM.b(1,3,1) = 1 % rBA2 to right insula stimulation modulation
DCM.b(2,1,2) = 1; % left temporal pole to rBA2 imagery modulation
DCM.b(3,1,2) = 1; % right insula to rBA2 imagery modulation

DCM.c = [0, 0, 1;  % Driving input to `rBA2`
         0, 0, 1;  % Driving input to `left_temporal_pole`
         0, 0, 1]; % Driving input to `right_insula`
% 
 save(fullfile(DCM_folder_path,'DCM_m4_backward_imag_forward_stim.mat'),'DCM');

% % DCM Estimation
% %--------------------------------------------------------------------------
clear matlabbatch
matlabbatch = [];
matlabbatch{1}.spm.dcm.fmri.estimate.dcmmat = {...
    fullfile(DCM_folder_path,'DCM_full_model.mat'); ...
    fullfile(DCM_folder_path,'DCM_m1_forward_no_imagery.mat') ; ...
    fullfile(DCM_folder_path,'DCM_m2_forward_imagery.mat') ; ...
    fullfile(DCM_folder_path,'DCM_m3_backwards_imagery.mat') ; ...
    fullfile(DCM_folder_path,'DCM_m4_backward_imag_forward_stim.mat')};

spm_jobman('run',matlabbatch);
% 
% 
end

