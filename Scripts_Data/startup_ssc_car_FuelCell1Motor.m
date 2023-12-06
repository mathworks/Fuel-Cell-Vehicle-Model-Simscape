% Startup file for Fuel Cell Vehicle Project
% Copyright 2019-2023 The MathWorks, Inc.

load FuelCellParams 
load ssc_FuelCell1Motor_op10sec

%% Create custom components for fuel cell
custom_code_fc = dir('**/unidir_dcdc_converter.sscp');
cd([custom_code_fc.folder '/..'])
ssc_build('GasN');
ssc_build('gn_supplement');
ssc_build('custom_dcdc_uni');
ssc_build('customMath');

curr_proj = simulinkproject;
cd(curr_proj.RootFolder);

open_system('ssc_car_fuel_cell_1motor')
