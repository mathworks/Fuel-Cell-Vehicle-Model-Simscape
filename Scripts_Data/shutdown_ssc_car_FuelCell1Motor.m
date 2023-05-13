% Shutdown script for project
% Copyright 2019-2023 The MathWorks, Inc.

%% Code for cleaning Simscape custom library at shutdown
% Change to folder with package directory
curr_proj = simulinkproject;
cd(curr_proj.RootFolder)

custom_code_fc = dir('**/unidir_dcdc_converter.sscp');
cd([custom_code_fc.folder '/..'])

% Clean custom library
if(exist('+custom_dcdc_uni','dir') && exist('custom_dcdc_uni_lib.slx','file'))
    ssc_clean custom_dcdc_uni
end

if(exist('+gn_supplement','dir') && exist('gn_supplement_lib.slx','file'))
    ssc_clean gn_supplement
end

if(exist('+customMath','dir') && exist('customMath_lib.slx','file'))
    ssc_clean customMath
end

if(exist('+GasN','dir') && exist('GasN_lib.slx','file'))
    ssc_clean GasN
end

if(exist('+gn_supplement','dir') && exist('gn_supplement_lib.slx','file'))
    ssc_clean gn_supplement
end

% Change to root folder
cd(curr_proj.RootFolder)

