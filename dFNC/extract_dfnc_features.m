clear all; close all;
cd('/media/jilanxin/DATA2/DFC_project/MSC-derivatives/cond4_results_70session');
load('Schaefer50_20TR_cluster_results_001.mat');
load('Schaefer50_20TR_dfc_roi.mat');

% TR in seconds
TR = dfcRoiInfo.TR;
% No. of data sets
M = length(dfcRoiInfo.outputFiles);
% Get no of windows
load(dfcRoiInfo.outputFiles{1},'FNCdyn');
Nwin = size(FNCdyn,1);

states = reshape(clusterInfo.IDXall,M, Nwin);
time_in_sec = (1:Nwin)*TR(1);

% % Plot subject1 state vector
% plot(time_in_sec, states(1,:));

dwell_time_mat = zeros(M,6);
for i = 1:M
    dwell_time_mat(i,1) = length(find(states(i,:)==1))*TR(1);
    dwell_time_mat(i,2) = length(find(states(i,:)==2))*TR(1);
    dwell_time_mat(i,3) = length(find(states(i,:)==3))*TR(1);
    dwell_time_mat(i,4) = length(find(states(i,:)==4))*TR(1);
    dwell_time_mat(i,5) = length(find(states(i,:)==5))*TR(1);
    dwell_time_mat(i,6) = length(find(states(i,:)==6))*TR(1);
end

% save('dwell_time_orig','dwell_time_mat');

% states = [states(:,1:300),zeros(70,300),states(:,301:498)];
% states_by_sub = [reshape(states(1:10,:)',1,7980);reshape(states(11:20,:)',1,7980);reshape(states(21:30,:)',1,7980);reshape(states(31:40,:)',1,7980);reshape(states(41:50,:)',1,7980);reshape(states(51:60,:)',1,7980);reshape(states(61:70,:)',1,7980)];

states_by_sub = [reshape(states(1:10,:)',1,4980);reshape(states(11:20,:)',1,4980);reshape(states(21:30,:)',1,4980);reshape(states(31:40,:)',1,4980);reshape(states(41:50,:)',1,4980);reshape(states(51:60,:)',1,4980);reshape(states(61:70,:)',1,4980)];

% states_reorder = changem(states_by_sub,[1 2 3 4 5 6],[5 1 4 6 2 3]);
% states_reorder = changem(states_by_sub,[1 2 3 4 5 6],[6 2 1 4 5 3]);
% states_reorder = changem(states_by_sub,[1 2 3 4 5 6],[2 3 1 4 5 6]);
% states_reorder = changem(states_by_sub,[1 2 3 4 5 6],[5 1 4 6 2 3]);
states_reorder = changem(states_by_sub,[1 2 3 4 5 6],[5 3 2 4 1 6]);

% figure
% imagesc(states_by_sub);
figure
imagesc(states_reorder);

