clear all; close all;
% ID = xlsread('Lanxin_subject_selection_file_LJ0408.xlsx','Sheet1','A2:A123');
% template = xlsread('Lanxin_subject_selection_file_LJ0408.xlsx','Sheet1','C2:C123');
% frame_count = xlsread('Lanxin_subject_selection_file_LJ0408.xlsx','Sheet1','D2:D123');
% load('/media/jilanxin/DATA2/fetal_brain/pre-proc-subj.mat')
ID = [2122; 2126];
% spm('Defaults','fMRI');
% spm_jobman('initcfg');

check_frame = zeros(length(ID),1);
merged_count = zeros(length(ID),1); 

for i=1:length(ID)
    input = {};
    DATADIR_T1 = sprintf('/media/jilanxin/DATA2/fetal_brain/LANXIN_DYNAMIC_FC_Data/%d-T1',ID(i));
    DATADIR_T2 = sprintf('/media/jilanxin/DATA2/fetal_brain/LANXIN_DYNAMIC_FC_Data/%d-T2',ID(i));
    % Folders are named either by T1 or T2
    TMP = '/media/jilanxin/DATA2/fetal_brain/FetalAtlas/weekly-T2/wk32';
    
    if isdir(DATADIR_T1)
        DATADIR = DATADIR_T1;
    else
        DATADIR = DATADIR_T2;
    end
    
    cd(DATADIR);
%     sessions = dir('*run*');
    sessions = dir('*zoom*');
    for j = 1:length(sessions)
        cd(sessions(j,1).name)
        files = dir('rwr*V*.nii');
        filnames = fullfile(pwd,{files(1).name});
        filnames = strcat(filnames(1),',1');
        input{end+1} = filnames{1};
        cd('..');
    end
    input{end+1} = '/media/jilanxin/DATA2/fetal_brain/FetalAtlas/wk32.nii,1';
    input = input';
    if  ~isempty(input)
        copyfile('/media/jilanxin/DATA2/fetal_brain/check_reg_job.m','check_reg_job.m');
        check_reg_job(input);
        saveas(gcf,'check_reg.png')
    end
end