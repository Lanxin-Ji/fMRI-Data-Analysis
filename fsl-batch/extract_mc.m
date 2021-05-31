clear all; close all;
workingdir = '/media/jilanxin/DATA2/fetal_brain/LANXIN_DYNAMIC_FC_Data/';
cd(workingdir)
sublist = dir(workingdir);
mean_abs_wkly_tmp = zeros(121,0);
mean_abs_32wk_tmp = zeros(121,0);

for i=4:length(sublist)
    cd(sublist(i).name)
    if exist('merged_data_std.feat/mc','dir')
        mean_abs_wkly_tmp(i-3,1) = load('merged_data_std.feat/mc/prefiltered_func_data_mcf_abs_mean.rms');
    end
    
    if exist('merged_data_std-avg.feat/mc','dir')
        mean_abs_32wk_tmp(i-3,1) = load('merged_data_std-avg.feat/mc/prefiltered_func_data_mcf_abs_mean.rms');
    end
    cd(workingdir);
end
