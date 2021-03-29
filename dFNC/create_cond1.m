clear all; close all

for i=1:7
    for j = 1:10
        foldername = sprintf('/media/jilanxin/DATA2/DFC_project/MSC-derivatives/data_70ses_cond1/sub%02d/sess%02d/',i,j);
        cd(foldername);
        split_cmd = sprintf('fslsplit derivatives_volume_pipeline_sub-MSC%02d_processed_restingstate_timecourses_ses-func%02d_talaraich_sub-MSC%02d_ses-func%02d_task-rest_bold_talaraich.nii',i,j,i,j);
        disp(split_cmd)
        system(split_cmd);
        for m=300:599
            rm_cmd = sprintf('rm vol%04d.nii.gz',m);
            system(rm_cmd);
        end
        system('fslmerge -t func_cond1 vol*');
        system('rm vol*');
        system('rm derivatives*');
        filename = sprintf('/media/jilanxin/DATA2/DFC_project/MSC-derivatives/data_nifti_cond1/sub%02d/sess%02d/func_cond1.nii.gz',i,j);
        disp(filename)
    end
end

    

