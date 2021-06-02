%-----------------------------------------------------------------------
% Job saved on 01-Jun-2021 12:53:52 by cfg_util (rev $Rev: 7345 $)
% spm SPM - SPM12 (7487)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------
%%
function check_reg_job(input)
matlabbatch{1}.spm.util.checkreg.data = input;
% matlabbatch{1}.spm.util.checkreg.data = {
%                                          '/media/jilanxin/DATA2/fetal_brain/SPM_batch_test_example/2013-T1_run1_maskA-reoriented/rwr1V-0039.nii,1'
%                                          '/media/jilanxin/DATA2/fetal_brain/SPM_batch_test_example/2013-T1_run1_maskB-reoriented/rwr1V-0051.nii,1'
%                                          '/media/jilanxin/DATA2/fetal_brain/SPM_batch_test_example/2013-T1_run1_maskC-reoriented/rwr1V-0070.nii,1'
%                                          '/media/jilanxin/DATA2/fetal_brain/SPM_batch_test_example/2013-T1_run1_maskD-reoriented/rwr1V-0117.nii,1'
%                                          '/media/jilanxin/DATA2/fetal_brain/SPM_batch_test_example/2013-T1_run1_maskE-reoriented/rwr1V-0135.nii,1'
%                                          '/media/jilanxin/DATA2/fetal_brain/SPM_batch_test_example/2013-T1_run2_maskA-reoriented/rwr2V-0009.nii,1'
%                                          '/media/jilanxin/DATA2/fetal_brain/SPM_batch_test_example/2013-T1_run2_maskB-reoriented/rwr2V-0053.nii,1'
%                                          '/media/jilanxin/DATA2/fetal_brain/SPM_batch_test_example/2013-T1_run2_maskC-reoriented/rwr2V-0098.nii,1'
%                                          '/media/jilanxin/DATA2/fetal_brain/SPM_batch_test_example/2013-T1_run2_maskD-reoriented/rwr2V-0116.nii,1'
%                                          '/media/jilanxin/DATA2/fetal_brain/SPM_batch_test_example/2013-T1_run2_maskE-reoriented/rwr2V-0130.nii,1'
%                                          '/media/jilanxin/DATA2/fetal_brain/SPM_batch_test_example/2013-T1_run2_maskF-reoriented/rwr2V-0160.nii,1'
%                                          };
spm_jobman('run',matlabbatch);
clear matlabbatch                                   
%%
end