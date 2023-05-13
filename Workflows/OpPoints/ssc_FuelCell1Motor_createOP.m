% Script to create operating point from snapshot of simulation results
% Copyright 2020-2023 The MathWorks, Inc.

% Open model and configure
mdl = 'ssc_car_fuel_cell_1motor';
open_system(mdl);
set_param(mdl,'SimscapeUseOperatingPoints','off');

% Set up and run test
set_param([mdl '/Driver/Drive Cycle'],'LabelModeActiveChoice','Data');
set_param([mdl '/Driver/Drive Cycle/Drive Cycle Data'],'popup_cycle','Cycle 1');

temp_StopTime = get_param(mdl,'StopTime');
set_param(mdl,'StopTime','10');
sim(bdroot);
set_param(mdl,'StopTime',temp_StopTime);

% Save Operating Point
ssc_FuelCell1Motor_op10sec = simscape.op.create(simlog_ssc_FuelCell1Motor,10);
save ssc_FuelCell1Motor_op10sec ssc_FuelCell1Motor_op10sec