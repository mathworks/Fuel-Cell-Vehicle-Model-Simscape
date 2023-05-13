%% Vehicle with Fuel Cell Powertrain
% 
% This example shows a fuel cell powertrain modeled in Simscape.  A single
% fuel cell stack in parallel with a battery powers a single motor that
% propels the vehicle. The fuel cell is modeled using a custom domain to
% track the different species of gas that are used in the fuel cell.  The
% vehicle can be tested on custom drive cycles or using the Drive Cycle
% Source from Powertrain Blockset.
% 
% Products Used
%
% * <https://www.mathworks.com/products/matlab.html MATLAB>
% * <https://www.mathworks.com/products/matlab.html Simulink>
% * <https://www.mathworks.com/products/simscape.html Simscape>
% * <https://www.mathworks.com/products/simscape-driveline.html Simscape Driveline>
% * <https://www.mathworks.com/products/simscape-electrical.html Simscape Electrical>
% * <https://www.mathworks.com/products/simscape-fluids.html Simscape Fluids>
% * <https://www.mathworks.com/products/powertrain.html Powertrain Blockset>
%  
%
% Copyright 2019-2023 The MathWorks, Inc.


%% Model

open_system('ssc_car_fuel_cell_1motor')

set_param(find_system(bdroot,'MatchFilter',@Simulink.match.allVariants,'FindAll','on','type','annotation','Tag','ModelFeatures'),'Interpreter','off');

%% Powertrain Subsystem
%
% The fuel cell and battery are connected on a DC electrical network to the
% motor.  The control system determines how much power to draw from the
% battery and fuel cell.  During braking events, power is fed back into the
% battery to recharge it.  A thermal system modeled using a fluid network
% controls the temperature of the battery, DC-DC converters, and the motor.

open_system('ssc_car_fuel_cell_1motor/Vehicle/Powertrain/FuelCell1Motor','force')

%% Fuel Cell Subsystem
%
% The flow of oxygen, hydrogen, nitrogen, and water is captured in a custom
% Simscape domain.  Equations for reactions and heat generated are
% implemented in Simscape language.  A thermal management system keeps the
% fuel cell at the optimal operating temperature.

open_system('ssc_car_fuel_cell_1motor/Vehicle/Powertrain/FuelCell1Motor/Fuel Cell/Fuel Cell','force')

%% Simulation Results from Simscape Logging:  Cycle 1
%
% Plot shows how the current from the battery and fuel cell vary as the car
% is driven along a standard drive cycle.  Note that the battery is
% recharged (current changes sign) while the fuel cell is only discharged.

set_param('ssc_car_fuel_cell_1motor/Driver/Drive Cycle','LabelModeActiveChoice','Data');
set_param('ssc_car_fuel_cell_1motor/Driver/Drive Cycle/Drive Cycle Data','popup_cycle','Cycle 1');
set_param('ssc_car_fuel_cell_1motor','StopTime','195');
sim('ssc_car_fuel_cell_1motor');
sm_car_plot7power(logsout_ssc_FuelCell1Motor);
sm_car_plot8fuelcell(simlog_ssc_FuelCell1Motor);

%% Simulation Results from Simscape Logging:  Cycle 2

set_param('ssc_car_fuel_cell_1motor/Driver/Drive Cycle','LabelModeActiveChoice','Data');
set_param('ssc_car_fuel_cell_1motor/Driver/Drive Cycle/Drive Cycle Data','popup_cycle','Cycle 2');
set_param('ssc_car_fuel_cell_1motor','StopTime','2474');
sim('ssc_car_fuel_cell_1motor');
sm_car_plot7power(logsout_ssc_FuelCell1Motor);
sm_car_plot8fuelcell(simlog_ssc_FuelCell1Motor);

%%
%clear all
close all
bdclose all