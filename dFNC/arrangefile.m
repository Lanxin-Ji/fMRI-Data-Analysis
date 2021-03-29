clear all;close all

% for sub=1:7
%     subfolder = sprintf('data_nifti_s/sub%02d',sub);
%     mkdir(subfolder)
%     
%     for session=1:10
%         sessfolder = fullfile(subfolder,sprintf('/sess%02d',session));
%         mkdir(sessfolder)
%         file_to_move = sprintf('data_nifti_s/sderivatives_volume_pipeline_sub-MSC%02d_processed_restingstate_timecourses_ses-func%02d_talaraich_sub-MSC%02d_ses-func%02d_task-rest_bold_talaraich.nii',sub,session,sub,session);
%         movefile(file_to_move,sessfolder);
%         %file_to_move
%     end
% end
% 
for sub=1:7
    subfolder = sprintf('/media/jilanxin/DATA2/DFC_project/MSC-derivatives/data_nifti_cond1/sub%02d',sub);
    
    for session=1:10
        sessfolder = fullfile(subfolder,sprintf('/sess%02d',session));

        file_to_move = sprintf('%s/derivatives_volume_pipeline_sub-MSC%02d_processed_restingstate_timecourses_ses-func%02d_talaraich_sub-MSC%02d_ses-func%02d_task-rest_bold_talaraich.nii',sessfolder,sub,session,sub,session);
        copyfile (file_to_move, 'data_nifti_s/');
        %file_to_move
    end
end
    