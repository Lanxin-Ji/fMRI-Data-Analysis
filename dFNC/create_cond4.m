clear all; close all

for i=1:7
    for j = 1:10
        foldername = sprintf('/media/jilanxin/DATA2/DFC_project/MSC-derivatives/data_nifti_cond4/sub%02d/sess%02d/',i,j);
        cd(foldername);
        split_cmd = 'fslsplit func_cond1.nii.gz';
        disp(split_cmd);
        system(split_cmd);
        
        shuffle_id = randperm(518);
        for m=0:517
            mv_cmd = sprintf('mv vol%04d.nii.gz rand%04d.nii.gz',m,shuffle_id(m+1));
            system(mv_cmd)
        end
        
        system('fslmerge -t func_cond4 rand*');
        system('rm rand*');
        system('rm func_cond1.nii.gz');
        filename = sprintf('/media/jilanxin/DATA2/DFC_project/MSC-derivatives/data_nifti_cond4/sub%02d/sess%02d/func_cond4.nii.gz',i,j);
        disp(filename)
    end
end



