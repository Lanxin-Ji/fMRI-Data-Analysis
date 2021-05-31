clear all; close all;
ID = xlsread('Lanxin_subject_selection_file_LJ0408.xlsx','Sheet1','A2:A123');
template = xlsread('Lanxin_subject_selection_file_LJ0408.xlsx','Sheet1','C2:C123');
frame_count = xlsread('Lanxin_subject_selection_file_LJ0408.xlsx','Sheet1','D2:D123');
load('/media/jilanxin/DATA2/fetal_brain/pre-proc-subj.mat')
spm('Defaults','fMRI');
spm_jobman('initcfg');

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
    sessions = dir('*run*');
    for j = 1:length(sessions)
        cd(sessions(j,1).name)
        files = dir('*V*.nii');
        filnames = fullfile(pwd,{files.name});
        input{end+1} = filnames';
        cd('..');
    end
    if  ~isempty(input)
        copyfile('/media/jilanxin/DATA2/fetal_brain/pre_proc_subj_job.m','pre_proc_subj_job.m');
        pre_proc_subj_job(input);
        
        copyfile */4D.nii 4D.nii
    end
end