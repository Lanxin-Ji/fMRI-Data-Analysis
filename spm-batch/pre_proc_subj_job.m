%-----------------------------------------------------------------------
% Job saved on 26-May-2021 23:12:06 by cfg_util (rev $Rev: 7345 $)
% spm SPM - SPM12 (7487)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------
function pre_proc_subj_job(input)
% spm('Defaults','fMRI');
% spm_jobman('initcfg');

matlabbatch{1}.cfg_basicio.file_dir.file_ops.cfg_named_file.name = 'segments';
%%
matlabbatch{1}.cfg_basicio.file_dir.file_ops.cfg_named_file.files = input;
%%
for i=1:length(input)
    var1 = sprintf('Named File Selector: segments(%d) - Files',i);
    var2 = substruct('.','files', '{}',{i})';
    matlabbatch{2}.spm.spatial.realign.estwrite.data{i}(1) = cfg_dep(var1, substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), var2);
end
matlabbatch{2}.spm.spatial.realign.estwrite.eoptions.quality = 0.9;
matlabbatch{2}.spm.spatial.realign.estwrite.eoptions.sep = 4;
matlabbatch{2}.spm.spatial.realign.estwrite.eoptions.fwhm = 5;
matlabbatch{2}.spm.spatial.realign.estwrite.eoptions.rtm = 1;
matlabbatch{2}.spm.spatial.realign.estwrite.eoptions.interp = 2;
matlabbatch{2}.spm.spatial.realign.estwrite.eoptions.wrap = [0 0 0];
matlabbatch{2}.spm.spatial.realign.estwrite.eoptions.weight = '';
matlabbatch{2}.spm.spatial.realign.estwrite.roptions.which = [2 1];
matlabbatch{2}.spm.spatial.realign.estwrite.roptions.interp = 4;
matlabbatch{2}.spm.spatial.realign.estwrite.roptions.wrap = [0 0 0];
matlabbatch{2}.spm.spatial.realign.estwrite.roptions.mask = 1;
matlabbatch{2}.spm.spatial.realign.estwrite.roptions.prefix = 'r';
for i=1:length(input)
    var1 = sprintf('Realign: Estimate & Reslice: Resliced Images (Sess %d)',i);
    var2 = substruct('.','sess', '()',{i}, '.','rfiles');
    matlabbatch{3}.spm.tools.oldnorm.estwrite.subj(i).source(1) = cfg_dep(var1, substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), var2);
    matlabbatch{3}.spm.tools.oldnorm.estwrite.subj(i).wtsrc = '';
    matlabbatch{3}.spm.tools.oldnorm.estwrite.subj(i).resample(1) = cfg_dep(var1, substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), var2);
end

matlabbatch{3}.spm.tools.oldnorm.estwrite.eoptions.template = {'/media/jilanxin/DATA2/fetal_brain/FetalAtlas/wk32.nii,1'};
matlabbatch{3}.spm.tools.oldnorm.estwrite.eoptions.weight = '';
matlabbatch{3}.spm.tools.oldnorm.estwrite.eoptions.smosrc = 8;
matlabbatch{3}.spm.tools.oldnorm.estwrite.eoptions.smoref = 0;
matlabbatch{3}.spm.tools.oldnorm.estwrite.eoptions.regtype = 'mni';
matlabbatch{3}.spm.tools.oldnorm.estwrite.eoptions.cutoff = 25;
matlabbatch{3}.spm.tools.oldnorm.estwrite.eoptions.nits = 16;
matlabbatch{3}.spm.tools.oldnorm.estwrite.eoptions.reg = 1;
matlabbatch{3}.spm.tools.oldnorm.estwrite.roptions.preserve = 0;
matlabbatch{3}.spm.tools.oldnorm.estwrite.roptions.bb = [-78 -112 -70
                                                         78 76 85];
matlabbatch{3}.spm.tools.oldnorm.estwrite.roptions.vox = [2 2 2];
matlabbatch{3}.spm.tools.oldnorm.estwrite.roptions.interp = 1;
matlabbatch{3}.spm.tools.oldnorm.estwrite.roptions.wrap = [0 0 0];
matlabbatch{3}.spm.tools.oldnorm.estwrite.roptions.prefix = 'w';

for i=1:length(input)
    var1 = sprintf('Realign: Estimate & Reslice: Resliced Images (Sess %d)',i);
    var2 = substruct('.','sess', '()',{i}, '.','rfiles');
    matlabbatch{3}.spm.tools.oldnorm.estwrite.subj(i).source(1) = cfg_dep(var1, substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), var2);
    matlabbatch{3}.spm.tools.oldnorm.estwrite.subj(i).wtsrc = '';
    matlabbatch{3}.spm.tools.oldnorm.estwrite.subj(i).resample(1) = cfg_dep(var1, substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), var2);
end

for i=1:length(input)
    matlabbatch{4}.spm.spatial.realign.estwrite.data{1}(i) = cfg_dep('Old Normalise: Estimate & Write: Normalised Images (Subj 1)', substruct('.','val', '{}',{3}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('()',{i}, '.','files'));
end

matlabbatch{4}.spm.spatial.realign.estwrite.eoptions.quality = 0.9;
matlabbatch{4}.spm.spatial.realign.estwrite.eoptions.sep = 4;
matlabbatch{4}.spm.spatial.realign.estwrite.eoptions.fwhm = 5;
matlabbatch{4}.spm.spatial.realign.estwrite.eoptions.rtm = 1;
matlabbatch{4}.spm.spatial.realign.estwrite.eoptions.interp = 2;
matlabbatch{4}.spm.spatial.realign.estwrite.eoptions.wrap = [0 0 0];
matlabbatch{4}.spm.spatial.realign.estwrite.eoptions.weight = '';
matlabbatch{4}.spm.spatial.realign.estwrite.roptions.which = [2 1];
matlabbatch{4}.spm.spatial.realign.estwrite.roptions.interp = 4;
matlabbatch{4}.spm.spatial.realign.estwrite.roptions.wrap = [0 0 0];
matlabbatch{4}.spm.spatial.realign.estwrite.roptions.mask = 1;
matlabbatch{4}.spm.spatial.realign.estwrite.roptions.prefix = 'r';
matlabbatch{5}.spm.util.cat.vols(1) = cfg_dep('Realign: Estimate & Reslice: Resliced Images (Sess 1)', substruct('.','val', '{}',{4}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','sess', '()',{1}, '.','rfiles'));
matlabbatch{5}.spm.util.cat.name = '4D.nii';
matlabbatch{5}.spm.util.cat.dtype = 4;
matlabbatch{5}.spm.util.cat.RT = NaN;

spm_jobman('run',matlabbatch);
clear matlabbatch
end
