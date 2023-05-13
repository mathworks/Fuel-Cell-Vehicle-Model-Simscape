function sm_car_plot8fuelcell(simlog_data)
% Code to plot simulation results from sm_car
%% Plot Description:
%
% Plot results from electric powertrains
%
% Copyright 2016-2023 The MathWorks, Inc.

% Reuse figure if it exists, else create new figure
fig_handle_name =   'h8_sm_car';

Init_type = evalin('base','Init.Type');

handle_var = evalin('base',['who(''' fig_handle_name ''')']);
if(isempty(handle_var))
    evalin('base',[fig_handle_name ' = figure(''Name'', ''' fig_handle_name ''');']);
elseif ~isgraphics(evalin('base',handle_var{:}))
    evalin('base',[fig_handle_name ' = figure(''Name'', ''' fig_handle_name ''');']);
end
figure(evalin('base',fig_handle_name))
clf(evalin('base',fig_handle_name))

temp_colororder = get(gca,'defaultAxesColorOrder');

% Get simulation results
electrolyte_ph2  = simlog_data.Vehicle.Powertrain.FuelCell1Motor.Fuel_Cell.Fuel_Cell.Electrolyte.pH2.series.values;
electrolyte_po2  = simlog_data.Vehicle.Powertrain.FuelCell1Motor.Fuel_Cell.Fuel_Cell.Electrolyte.pO2.series.values;
stack_T = simlog_data.Vehicle.Powertrain.FuelCell1Motor.Fuel_Cell.Fuel_Cell.Electrolyte.H.T.series.values;
simlog_t = simlog_data.Vehicle.Powertrain.FuelCell1Motor.Fuel_Cell.Fuel_Cell.Electrolyte.H.T.series.time;

simlog_handles(1) = subplot(211);
plot(simlog_t,electrolyte_ph2,'LineWidth',1);
hold on
plot(simlog_t,electrolyte_po2,'LineWidth',1);

ylabel('Partial Pressure (atm)');
title('Partial Pressures in Fuel Cell Stack','FontSize',12);
legend({'Hydrogen','Oxygen'},'Location','Best');

simlog_handles(2) = subplot(212);
plot(simlog_t,stack_T,'LineWidth',1);
title('Stack Temperature (K)','FontSize',12);
ylabel('Temperature (K)');
xlabel('Time (sec)');

linkaxes(simlog_handles,'x')



