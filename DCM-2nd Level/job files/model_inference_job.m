%-----------------------------------------------------------------------
% Job saved on 08-Aug-2024 11:15:46 by cfg_util (rev $Rev: 7345 $)
% spm SPM - SPM12 (7771)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------
matlabbatch{1}.spm.dcm.spec.fmri.group.output.dir = {'/Volumes/GRETA/DCM_project'};
matlabbatch{1}.spm.dcm.spec.fmri.group.output.name = 'specify_group';
matlabbatch{1}.spm.dcm.spec.fmri.group.template.fulldcm = {'/Volumes/GRETA/DCM_project/sub-002/DCM/DCM_m16_full.mat'};
matlabbatch{1}.spm.dcm.spec.fmri.group.template.altdcm = {'/Volumes/GRETA/DCM_project/sub-002/DCM/DCM_m2_forward_imagery.mat'};
matlabbatch{1}.spm.dcm.spec.fmri.group.data.spmmats = {'/Volumes/GRETA/DCM_project/sub-002/GLM/SPM.mat'};
matlabbatch{1}.spm.dcm.spec.fmri.group.data.session = 1;
matlabbatch{1}.spm.dcm.spec.fmri.group.data.region = {
                                                      {'/Volumes/GRETA/DCM_project/sub-002/VOI/VOI_rBA2_1.mat'}
                                                      {'/Volumes/GRETA/DCM_project/sub-002/VOI/VOI_right_insula_1.mat'}
                                                      {'/Volumes/GRETA/DCM_project/sub-002/VOI/VOI_left_temporal_pole_1.mat'}
                                                      }';
matlabbatch{2}.spm.dcm.peb.specify.name = '<UNDEFINED>';
matlabbatch{2}.spm.dcm.peb.specify.model_space_mat = '<UNDEFINED>';
matlabbatch{2}.spm.dcm.peb.specify.dcm.index = 1;
matlabbatch{2}.spm.dcm.peb.specify.cov.none = struct([]);
matlabbatch{2}.spm.dcm.peb.specify.fields.default = {
                                                     'A'
                                                     'B'
                                                     }';
matlabbatch{2}.spm.dcm.peb.specify.priors_between.components = 'All';
matlabbatch{2}.spm.dcm.peb.specify.priors_between.ratio = 16;
matlabbatch{2}.spm.dcm.peb.specify.priors_between.expectation = 0;
matlabbatch{2}.spm.dcm.peb.specify.priors_between.var = 0.0625;
matlabbatch{2}.spm.dcm.peb.specify.priors_glm.group_ratio = 1;
matlabbatch{2}.spm.dcm.peb.specify.estimation.maxit = 64;
matlabbatch{2}.spm.dcm.peb.specify.show_review = 0;
matlabbatch{3}.spm.dcm.bms.inference.dir = {'/Volumes/GRETA/DCM_project/GroupLevelAnalysis'};
matlabbatch{3}.spm.dcm.bms.inference.sess_dcm{1}.dcmmat = {
                                                           '/Volumes/GRETA/DCM_project/sub-002/DCM/DCM_m16_full.mat'
                                                           '/Volumes/GRETA/DCM_project/sub-002/DCM/DCM_m1_no_imagery.mat'
                                                           '/Volumes/GRETA/DCM_project/sub-002/DCM/DCM_m2_forward_imagery.mat'
                                                           '/Volumes/GRETA/DCM_project/sub-002/DCM/DCM_m3_backwards_imagery.mat'
                                                           '/Volumes/GRETA/DCM_project/sub-002/DCM/DCM_m4_backward_imag_forward_stim.mat'
                                                           };
matlabbatch{3}.spm.dcm.bms.inference.sess_dcm{2}.dcmmat = {
                                                           '/Volumes/GRETA/DCM_project/sub-003/DCM/DCM_m16_full.mat'
                                                           '/Volumes/GRETA/DCM_project/sub-003/DCM/DCM_m1_no_imagery.mat'
                                                           '/Volumes/GRETA/DCM_project/sub-003/DCM/DCM_m2_forward_imagery.mat'
                                                           '/Volumes/GRETA/DCM_project/sub-003/DCM/DCM_m3_backwards_imagery.mat'
                                                           '/Volumes/GRETA/DCM_project/sub-003/DCM/DCM_m4_backward_imag_forward_stim.mat'
                                                           };
matlabbatch{3}.spm.dcm.bms.inference.sess_dcm{3}.dcmmat = {
                                                           '/Volumes/GRETA/DCM_project/sub-004/DCM/DCM_m16_full.mat'
                                                           '/Volumes/GRETA/DCM_project/sub-004/DCM/DCM_m1_no_imagery.mat'
                                                           '/Volumes/GRETA/DCM_project/sub-004/DCM/DCM_m2_forward_imagery.mat'
                                                           '/Volumes/GRETA/DCM_project/sub-004/DCM/DCM_m3_backwards_imagery.mat'
                                                           '/Volumes/GRETA/DCM_project/sub-004/DCM/DCM_m4_backward_imag_forward_stim.mat'
                                                           };
matlabbatch{3}.spm.dcm.bms.inference.model_sp = {''};
matlabbatch{3}.spm.dcm.bms.inference.load_f = {''};
matlabbatch{3}.spm.dcm.bms.inference.method = 'RFX';
matlabbatch{3}.spm.dcm.bms.inference.family_level.family_file = {''};
matlabbatch{3}.spm.dcm.bms.inference.bma.bma_no = 0;
matlabbatch{3}.spm.dcm.bms.inference.verify_id = 1;
