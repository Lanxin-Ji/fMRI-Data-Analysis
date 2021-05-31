clear all; close all;
ID = xlsread('Lanxin_subject_selection_file_LJ0408.xlsx','Sheet1','A2:A123');
template = xlsread('Lanxin_subject_selection_file_LJ0408.xlsx','Sheet1','C2:C123');
frame_count = xlsread('Lanxin_subject_selection_file_LJ0408.xlsx','Sheet1','D2:D123');

% ID = [2020;2044;2218;2109;2147];
% template = [35.00;32.00;35.00;32.00;36.00];
% frame_count = [147;249;190;249;112];

check_frame = zeros(length(ID),1);
merged_count = zeros(length(ID),1);

for i=1:length(ID)
    DATADIR_T1 = sprintf('/media/jilanxin/DATA2/fetal_brain/LANXIN_DYNAMIC_FC_Data/%d-T1',ID(i));
    DATADIR_T2 = sprintf('/media/jilanxin/DATA2/fetal_brain/LANXIN_DYNAMIC_FC_Data/%d-T2',ID(i));
    % Folders are named either by T1 or T2
    TMP = sprintf('/media/jilanxin/DATA2/fetal_brain/FetalAtlas/weekly-T2/wk%d',template(i));
    
    if isdir(DATADIR_T1)
        DATADIR = DATADIR_T1;
    else
        DATADIR = DATADIR_T2;
    end
    
%     fprintf([DATADIR,' ',num2str(template(i))]);
    
    cmd = ['sh pre-proc ',DATADIR,' ',TMP];
    system(cmd);
    
    cmd = ['fslval ',DATADIR,'/merged_data_std dim4'];
    [status,merged_frame] = system(cmd);
    merged_count(i) = str2double(merged_frame);
    if str2double(merged_frame) ~= frame_count(i)
        check_frame(i) = 1;
    end
end

% failed subject #2117 2044 2109 2069 2006 2020 2152 2172 2218 2226 2147


% %% 2nd Realign 
% for i=70:length(ID)
%     DATADIR_T1 = sprintf('/media/jilanxin/DATA2/fetal_brain/LANXIN_DYNAMIC_FC_Data/%d-T1',ID(i));
%     DATADIR_T2 = sprintf('/media/jilanxin/DATA2/fetal_brain/LANXIN_DYNAMIC_FC_Data/%d-T2',ID(i));
%     
%     % Folders are named either by T1 or T2
%     if isdir(DATADIR_T1)
%         DATADIR = DATADIR_T1;
%     else
%         DATADIR = DATADIR_T2;
%     end
%     
% %     fprintf([DATADIR,' ',num2str(template(i))]);
%     
%     cmd = ['sh pre-proc-realign2 ',DATADIR];
%     system(cmd);
%     
%     sourcefile = [DATADIR,'/merged_data_std.feat/filtered_func_data.nii.gz'];
%     desfile = [DATADIR,'/r2wr1merged_data.nii.gz'];
%     copyfile(sourcefile,desfile);    
% end