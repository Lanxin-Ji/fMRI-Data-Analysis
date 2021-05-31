clear all; close all;
ID = xlsread('Lanxin_subject_selection_file_LJ0408.xlsx','Sheet1','A2:A123');
template = xlsread('Lanxin_subject_selection_file_LJ0408.xlsx','Sheet1','C2:C123');
frame_count = xlsread('Lanxin_subject_selection_file_LJ0408.xlsx','Sheet1','D2:D123');

check_frame = zeros(length(ID),1);
merged_count = zeros(length(ID),1); 

% for i=1:length(ID)
%     DATADIR_T1 = sprintf('/media/jilanxin/DATA2/fetal_brain/LANXIN_DYNAMIC_FC_Data/%d-T1',ID(i));
%     DATADIR_T2 = sprintf('/media/jilanxin/DATA2/fetal_brain/LANXIN_DYNAMIC_FC_Data/%d-T2',ID(i));
%     % Folders are named either by T1 or T2
%     TMP = '/media/jilanxin/DATA2/fetal_brain/FetalAtlas/weekly-T2/wk32';
%     
%     if isdir(DATADIR_T1)
%         DATADIR = DATADIR_T1;
%     else
%         DATADIR = DATADIR_T2;
%     end
%     
% %     fprintf([DATADIR,' ',num2str(template(i))]);
%     
%     cmd = ['bash pre-proc-avg ',DATADIR,' ',TMP];
%     system(cmd);
%     
%     cmd = ['fslval ',DATADIR,'/merged_data_std-avg dim4'];
%     [status,merged_frame] = system(cmd);
%     merged_count(i) = str2double(merged_frame);
%     if str2double(merged_frame) ~= frame_count(i)
%         check_frame(i) = 1;
%     end
% end



% %% 2nd Realign 
ID = [ID(1:68,1);ID(70:122)]; %NO.69 is empty
%%%%%%%%%%%%%%%stopped at 2155

for i=20:length(ID)
    DATADIR_T1 = sprintf('/media/jilanxin/DATA2/fetal_brain/LANXIN_DYNAMIC_FC_Data/%d-T1',ID(i));
    DATADIR_T2 = sprintf('/media/jilanxin/DATA2/fetal_brain/LANXIN_DYNAMIC_FC_Data/%d-T2',ID(i));
    
    % Folders are named either by T1 or T2
    if isdir(DATADIR_T1)
        DATADIR = DATADIR_T1;
    else
        DATADIR = DATADIR_T2;
    end
    
%     fprintf([DATADIR,' ',num2str(template(i))]);
    
    cmd = ['sh pre-proc-realign2 ',DATADIR];
    system(cmd);
    
    sourcefile = [DATADIR,'/merged_data_std-avg.feat/filtered_func_data.nii.gz'];
    desfile = [DATADIR,'/r2wr1merged_data-avg.nii.gz'];
    copyfile(sourcefile,desfile);    
end