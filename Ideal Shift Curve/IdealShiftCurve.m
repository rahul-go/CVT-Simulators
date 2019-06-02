%% Setup
% Reset
clear all;
close all;
clc;

% Engagement speed (TUNE)
engagement_speed = 3400;
plot_title = 'Speed Diagram';

% Car Specs
CVT_L = 3.85;                           % CVT low ratio
CVT_H = 0.96;                           % CVT high ratio
GB = 6.579;                             % Gearbox ratio
r = 11/12;                              % Effective wheel radius (ft)

% Notable engine RPMs
engine_idle = 1750;                     % Engine idle speed
peak_torque = 2700;                     % Peak torque
peak_power = 3600;                      % Peak power
engine_max = 3800;                      % Max engine speed



%% Calculate Vehicle Speed from Engine Speed + CVT Ratio
% Idle RPM
engine_speed_idle = engine_idle;
vehicle_speed_idle = 0;

% Clutching Phase
engine_speed_CP = engagement_speed - 200;   % Estimated
vehicle_speed_CP = vehicle_speed_idle;

% Low Ratio
engine_speed_L = engagement_speed;
vehicle_speed_L = engine_speed_L / 60 * 2 * pi / CVT_L / GB * r * 15/22;

% Peak power (low ratio)
engine_speed_1 = peak_power;                  
vehicle_speed_1 = engine_speed_1 / 60 * 2 * pi / CVT_L / GB * r * 15/22;

% Peak power (high ratio)
engine_speed_2 = peak_power;
vehicle_speed_2 = engine_speed_2 / 60 * 2 * pi / CVT_H / GB * r * 15/22;

% High Ratio
engine_speed_H = engine_max;
vehicle_speed_H = engine_speed_H / 60 * 2 * pi / CVT_H / GB * r * 15/22;



%% Plot
hold on;
% Max Engine Speed Line
plot([0, 100], [engine_max, engine_max], ...
    '--', 'LineWidth', 1.5, 'Color', [0, 0, 0]);
% Peak Power Line
plot([0, 100], [peak_power, peak_power], ...
    '--', 'LineWidth', 1.5, 'Color', [0, 0.5, 0]);
% Peak Torque Line
plot([0, 100], [peak_torque, peak_torque], ...
    '--', 'LineWidth', 1.5, 'Color', [0.75, 0, 0]);
% Engine Idle Speed Line
plot([0, 100], [engine_idle, engine_idle], ...
    '--', 'LineWidth', 1.5, 'Color', [0, 0, 0]);
% Low Ratio Line
plot([0, 100], [0, 100 * 22/15 / r * GB * CVT_L / 2 / pi * 60], ...
    '', 'LineWidth', 1.5, 'Color', [0.75, 0.75, 0.75]);
% High Ratio Line
plot([0, 100], [0, 100 * 22/15 / r * GB * CVT_H / 2 / pi * 60], ...
    '', 'LineWidth', 1.5, 'Color', [0.75, 0.75, 0.75]);
% Pre-Engagement (ESTIMATED)
engine_speed_data = [engine_speed_idle, engine_speed_CP, engine_speed_L];
vehicle_speed_data = [vehicle_speed_idle, vehicle_speed_CP, vehicle_speed_L];
plot(vehicle_speed_data, engine_speed_data, '--b', 'LineWidth', 2);
% Post-Engagement
engine_speed_data = [engine_speed_L, engine_speed_1, engine_speed_2, engine_speed_H];
vehicle_speed_data = [vehicle_speed_L, vehicle_speed_1, vehicle_speed_2, vehicle_speed_H];
plot(vehicle_speed_data, engine_speed_data, 'b', 'LineWidth', 4);
% Plot Circle
plot(vehicle_speed_L, engagement_speed, 'or', 'MarkerSize', 25, 'LineWidth', 4);
% Plot Options
title(plot_title);
xlim([0, 40]);
ylim([0, 4000]);
ylim([1500, 4000]);
xlabel('Vehicle Speed (mph)');
ylabel('Engine Speed (RPM)');
legend('Max RPM', 'Peak Power', 'Peak Torque', 'Idle RPM', ...
    'Low Ratio', 'High Ratio', 'Clutching Phase', 'Ideal Shift Curve', ...
    'Location', 'southeast');