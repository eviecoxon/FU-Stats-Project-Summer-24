spm_path = '/Users/canbolat/Desktop/spm12'; % Path to SPM folder

% set local data path
data_folder_path = '/Users/canbolat/Desktop/stats_project/data'; % Enter the root path of where your data is stored

% add paths
addpath(spm_path)
addpath(data_folder_path)

spm('defaults', 'fmri')
spm_jobman('initcfg')

subject_folder = {'sub-002','sub-003', 'sub-004', 'sub-007', 'sub-009'};

%% DCM Estimation
for j = 1:numel(subject_folder) % for loop from 1 to number of elements in folder_sub

    S = []; % init empty structure
    S.data_folder_path = data_folder_path; % add data folder path
    S.subject_folder = subject_folder{j}; % add subject path

    DCM_folder_path = fullfile(S.data_folder_path, S.subject_folder, 'DCM');
    addpath(DCM_folder_path)

    % Load the DCM model file
    load('DCM_m3_backwards_imagery'); % Change the filename as needed

    % Extract posterior estimates of each matrix
    ep_posterior_A = DCM.Ep.A;  % Intrinsic connections
    ep_posterior_B = DCM.Ep.B;  % Modulatory connections
    ep_posterior_C = DCM.Ep.C;  % Driving inputs

    % Extract posterior variance estimates of each matrix
    vp_posterior_A = DCM.Vp.A;  % Intrinsic connections
    vp_posterior_B = DCM.Vp.B;  % Modulatory connections
    vp_posterior_C = DCM.Vp.C;  % Driving inputs

    % Extract posterior precision estimates of each matrix
    pp_posterior_A = DCM.Pp.A;  % Intrinsic connections
    pp_posterior_B = DCM.Pp.B;  % Modulatory connections
    pp_posterior_C = DCM.Pp.C;  % Driving inputs

    %% For each connection

    % Endogenous connections (unchanged)
    ep_endog_rba2_to_ltp = ep_posterior_A(1, 2);
    ep_endog_ltp_to_rba2 = ep_posterior_A(2, 1);
    ep_endog_rba2_to_ri = ep_posterior_A(1, 3);
    ep_endog_ri_to_rba2 = ep_posterior_A(3, 1);

    % Endogenous connections (unchanged)
    vp_endog_rba2_to_ltp = vp_posterior_A(1, 2);
    vp_endog_ltp_to_rba2 = vp_posterior_A(2, 1);
    vp_endog_rba2_to_ri = vp_posterior_A(1, 3);
    vp_endog_ri_to_rba2 = vp_posterior_A(3, 1);

    % Endogenous connections (unchanged)
    pp_endog_rba2_to_ltp = pp_posterior_A(1, 2);
    pp_endog_ltp_to_rba2 = pp_posterior_A(2, 1);
    pp_endog_rba2_to_ri = pp_posterior_A(1, 3);
    pp_endog_ri_to_rba2 = pp_posterior_A(3, 1);

    % Modulatory connections
    % Stimulation
    ep_Stim_rba2_to_ltp = ep_posterior_B(2, 1, 1); % rba2 to ltp
    ep_Stim_rba2_to_ri = ep_posterior_B(3, 1, 1); % rba2 to right insula
    ep_Stim_ltp_to_rba2 = ep_posterior_B(1, 2, 1); % ltp to rba2
    ep_Stim_ri_to_rba2 = ep_posterior_B(1, 3, 1); % ri to rba2
    
    % Imagery
    ep_Imag_ri_to_rba2 = ep_posterior_B(1, 2, 2); % ri to rba2
    ep_Imag_ltp_to_rba2 = ep_posterior_B(1, 3, 2); % ltp to rba2
    
    % Modulatory connections
    % Stimulation
    vp_Stim_rba2_to_ltp = vp_posterior_B(2, 1, 1); % rba2 to ltp
    vp_Stim_rba2_to_ri = vp_posterior_B(3, 1, 1); % rba2 to right insula
    vp_Stim_ltp_to_rba2 = vp_posterior_B(1, 2, 1); % ltp to rba2
    vp_Stim_ri_to_rba2 = vp_posterior_B(1, 3, 1); % ri to rba2
    
    % Imagery
    vp_Imag_ri_to_rba2 = vp_posterior_B(1, 2, 2); % ri to rba2
    vp_Imag_ltp_to_rba2 = vp_posterior_B(1, 3, 2); % ltp to rba2
    
    % Modulatory connections
    % Stimulation
    pp_Stim_rba2_to_ltp = pp_posterior_B(2, 1, 1); % rba2 to ltp
    pp_Stim_rba2_to_ri = pp_posterior_B(3, 1, 1); % rba2 to right insula
    pp_Stim_ltp_to_rba2 = pp_posterior_B(1, 2, 1); % ltp to rba2
    pp_Stim_ri_to_rba2 = pp_posterior_B(1, 3, 1); % ri to rba2
    
    % Imagery
    pp_Imag_ri_to_rba2 = pp_posterior_B(1, 2, 2); % ri to rba2
    pp_Imag_ltp_to_rba2 = pp_posterior_B(1, 3, 2); % ltp to rba2
    
    % Driving input 
    ep_driving_input_stimulation_ltp = ep_posterior_C(2, 1); % Stimulation input to ltp
    ep_driving_input_stimulation_ri = ep_posterior_C(3, 1); % Stimulation input to ri
    
    ep_driving_input_imagery_ltp = ep_posterior_C(2, 2); % Imagery input to ltp
    ep_driving_input_imagery_ri = ep_posterior_C(3, 2); % Imagery input to ri
    
    % Driving input 
    vp_driving_input_stimulation_ltp = vp_posterior_C(2, 1); % Stimulation input to ltp
    vp_driving_input_stimulation_ri = vp_posterior_C(3, 1); % Stimulation input to ri
    
    vp_driving_input_imagery_ltp = vp_posterior_C(2, 2); % Imagery input to ltp
    vp_driving_input_imagery_ri = vp_posterior_C(3, 2); % Imagery input to ri
    
    % Driving input
    pp_driving_input_stimulation_ltp = pp_posterior_C(2, 1); % Stimulation input to ltp
    pp_driving_input_stimulation_ri = pp_posterior_C(3, 1); % Stimulation input to ri
    
    pp_driving_input_imagery_ltp = pp_posterior_C(2, 2); % Imagery input to ltp
    pp_driving_input_imagery_ri = pp_posterior_C(3, 2); % Imagery input to ri

%% To save txt file with all parameters ep, vp, pp for each connection:
% Define the file path for saving
output_file_path = fullfile(DCM_folder_path, 'DCM_values.txt');

% Open the file for writing
fid = fopen(output_file_path, 'w');

% Check if file opened successfully
if fid == -1
    error('Cannot open file %s for writing.', output_file_path);
end

% Write header information
fprintf(fid, 'Posterior Estimates (Ep), Variances (Vp), and Precisions (Pp):\n');

% Write Intrinsic Connections
fprintf(fid, '\nIntrinsic Connections:\n');
fprintf(fid, 'rba2 to left temporal pole:\n');
fprintf(fid, '  Ep: %.4f\n', ep_endog_rba2_to_ltp);
fprintf(fid, '  Vp: %.4f\n', vp_endog_rba2_to_ltp);
fprintf(fid, '  Pp: %.4f\n', pp_endog_rba2_to_ltp);

fprintf(fid, 'left temporal pole to rba2:\n');
fprintf(fid, '  Ep: %.4f\n', ep_endog_ltp_to_rba2);
fprintf(fid, '  Vp: %.4f\n', vp_endog_ltp_to_rba2);
fprintf(fid, '  Pp: %.4f\n', pp_endog_ltp_to_rba2);

fprintf(fid, 'rba2 to right insula:\n');
fprintf(fid, '  Ep: %.4f\n', ep_endog_rba2_to_ri);
fprintf(fid, '  Vp: %.4f\n', vp_endog_rba2_to_ri);
fprintf(fid, '  Pp: %.4f\n', pp_endog_rba2_to_ri);

fprintf(fid, 'right insula to rba2:\n');
fprintf(fid, '  Ep: %.4f\n', ep_endog_ri_to_rba2);
fprintf(fid, '  Vp: %.4f\n', vp_endog_ri_to_rba2);
fprintf(fid, '  Pp: %.4f\n', pp_endog_ri_to_rba2);

% Write Modulatory Connections
fprintf(fid, '\nModulatory Connections (Stim):\n');
fprintf(fid, 'rba2 to left temporal pole:\n');
fprintf(fid, '  Ep: %.4f\n', ep_Stim_rba2_to_ltp);
fprintf(fid, '  Vp: %.4f\n', vp_Stim_rba2_to_ltp);
fprintf(fid, '  Pp: %.4f\n', pp_Stim_rba2_to_ltp);

fprintf(fid, 'left temporal pole to rba2:\n');
fprintf(fid, '  Ep: %.4f\n', ep_Stim_ltp_to_rba2);
fprintf(fid, '  Vp: %.4f\n', vp_Stim_ltp_to_rba2);
fprintf(fid, '  Pp: %.4f\n', pp_Stim_ltp_to_rba2);

fprintf(fid, 'right insula to rba2:\n');
fprintf(fid, '  Ep: %.4f\n', ep_Stim_ri_to_rba2);
fprintf(fid, '  Vp: %.4f\n', vp_Stim_ri_to_rba2);
fprintf(fid, '  Pp: %.4f\n', pp_Stim_ri_to_rba2);

fprintf(fid, 'rba2 to right insula:\n');
fprintf(fid, '  Ep: %.4f\n', ep_Stim_rba2_to_ri);
fprintf(fid, '  Vp: %.4f\n', vp_Stim_rba2_to_ri);
fprintf(fid, '  Pp: %.4f\n', pp_Stim_rba2_to_ri);

fprintf(fid, '\nModulatory Connections (Imag):\n');
fprintf(fid, 'left temporal pole to rba2:\n');
fprintf(fid, '  Ep: %.4f\n', ep_Imag_ltp_to_rba2);
fprintf(fid, '  Vp: %.4f\n', vp_Imag_ltp_to_rba2);
fprintf(fid, '  Pp: %.4f\n', pp_Imag_ltp_to_rba2);

fprintf(fid, 'right insula to rba2:\n');
fprintf(fid, '  Ep: %.4f\n', ep_Imag_ri_to_rba2);
fprintf(fid, '  Vp: %.4f\n', vp_Imag_ri_to_rba2);
fprintf(fid, '  Pp: %.4f\n', pp_Imag_ri_to_rba2);

% Write Driving Inputs
fprintf(fid, '\nDriving Inputs:\n');
fprintf(fid, 'Stimulation to left temporal pole:\n');
fprintf(fid, '  Ep: %.4f\n', ep_driving_input_stimulation_ltp);
fprintf(fid, '  Vp: %.4f\n', vp_driving_input_stimulation_ltp);
fprintf(fid, '  Pp: %.4f\n', pp_driving_input_stimulation_ltp);

fprintf(fid, 'Stimulation to right insula:\n');
fprintf(fid, '  Ep: %.4f\n', ep_driving_input_stimulation_ri);
fprintf(fid, '  Vp: %.4f\n', vp_driving_input_stimulation_ri);
fprintf(fid, '  Pp: %.4f\n', pp_driving_input_stimulation_ri);

fprintf(fid, 'Imagery to left temporal pole:\n');
fprintf(fid, '  Ep: %.4f\n', ep_driving_input_imagery_ltp);
fprintf(fid, '  Vp: %.4f\n', vp_driving_input_imagery_ltp);
fprintf(fid, '  Pp: %.4f\n', pp_driving_input_imagery_ltp);

fprintf(fid, 'Imagery to right insula:\n');
fprintf(fid, '  Ep: %.4f\n', ep_driving_input_imagery_ri);
fprintf(fid, '  Vp: %.4f\n', vp_driving_input_imagery_ri);
fprintf(fid, '  Pp: %.4f\n', pp_driving_input_imagery_ri);

% Close the file
fclose(fid);

%% To plot parameters to bar plot:
% Define the file path for saving the bar plot
plot_file_path = fullfile(DCM_folder_path, 'DCM_parameters_plot.png');

% Data preparation
% Define connections and corresponding values
connections = {'rba2_to_ltp', 'ltp_to_rba2', 'rba2_to_ri', 'ri_to_rba2', ...
               'Stim_rba2_to_ltp', 'Stim_ltp_to_rba2', 'Stim_ri_to_rba2', 'Stim_rba2_to_ri', ...
               'Imag_ltp_to_rba2', 'Imag_ri_to_rba2', ...
               'Stimulation_ltp', 'Stimulation_ri', 'Imagery_ltp', 'Imagery_ri'};

% Posterior estimates (Ep), variances (Vp), precisions (Pp)
ep_values = [ep_endog_rba2_to_ltp, ep_endog_ltp_to_rba2, ep_endog_rba2_to_ri, ep_endog_ri_to_rba2, ...
             ep_Stim_rba2_to_ltp, ep_Stim_ltp_to_rba2, ep_Stim_ri_to_rba2, ep_Stim_rba2_to_ri, ...
             ep_Imag_ltp_to_rba2, ep_Imag_ri_to_rba2, ...
             ep_driving_input_stimulation_ltp, ep_driving_input_stimulation_ri, ep_driving_input_imagery_ltp, ep_driving_input_imagery_ri];

vp_values = [vp_endog_rba2_to_ltp, vp_endog_ltp_to_rba2, vp_endog_rba2_to_ri, vp_endog_ri_to_rba2, ...
             vp_Stim_rba2_to_ltp, vp_Stim_ltp_to_rba2, vp_Stim_ri_to_rba2, vp_Stim_rba2_to_ri, ...
             vp_Imag_ltp_to_rba2, vp_Imag_ri_to_rba2, ...
             vp_driving_input_stimulation_ltp, vp_driving_input_stimulation_ri, vp_driving_input_imagery_ltp, vp_driving_input_imagery_ri];

pp_values = [pp_endog_rba2_to_ltp, pp_endog_ltp_to_rba2, pp_endog_rba2_to_ri, pp_endog_ri_to_rba2, ...
             pp_Stim_rba2_to_ltp, pp_Stim_ltp_to_rba2, pp_Stim_ri_to_rba2, pp_Stim_rba2_to_ri, ...
             pp_Imag_ltp_to_rba2, pp_Imag_ri_to_rba2, ...
             pp_driving_input_stimulation_ltp, pp_driving_input_stimulation_ri, pp_driving_input_imagery_ltp, pp_driving_input_imagery_ri];

% Define a threshold for probabilities
threshold = 0.95;

% Create the bar plot
figure;
bar(ep_values, 'FaceColor', [0.5 0.7 1]); % Bar colors for estimates

% Add error bars
hold on;
errorbar(1:numel(ep_values), ep_values, sqrt(vp_values), 'k.', 'LineWidth', 1.5); % Variance error bars

% Add asterisks for probabilities above the threshold
ylims = ylim; % Get y-axis limits for positioning
for i = 1:numel(pp_values)
    if pp_values(i) > threshold
        text(i, ep_values(i) + 0.1 * diff(ylims), '*', 'FontSize', 12, 'FontWeight', 'bold', 'HorizontalAlignment', 'center');
    end
end

% Customize plot appearance
set(gca, 'XTick', 1:numel(connections), 'XTickLabel', connections, 'XTickLabelRotation', 45);
ylabel('Posterior Estimates (Ep)');
xlabel('Connections');
title('Model 3 Posterior Estimates with Variance and Probability');
legend('Posterior Estimates (Ep)', 'Variance (Vp)', 'Location', 'Best');
grid on;

% Save the plot
saveas(gcf, plot_file_path);

% Close the figure
close(gcf);
end