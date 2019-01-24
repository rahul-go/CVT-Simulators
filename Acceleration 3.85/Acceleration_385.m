%% Setup
% Reset
clear all;
close all;
clc;

load EngagementToPower.mat;             % Simulated
load ShiftAcceleration.mat;             % Simulated

% Slip Model
t = [0, 0.15];                          % From data
x = [0, 2.5];                           % From data

hold on;
plot(t, x, 'b', 'LineWidth', 4);
plot(t(end) + EngageToPower(:, 1), x(end) + EngageToPower(:, 2), 'r', 'LineWidth', 4);
plot(t(end) + EngageToPower(end, 1) + ShiftAcceleration(:, 1), ...
    x(end) + EngageToPower(end, 2) + ShiftAcceleration(:, 2), 'k', 'LineWidth', 4);
% 100ft
plot([0, 5], [100, 100], ...
    '', 'LineWidth', 1.5, 'Color', [0.75, 0.75, 0.75]);
% 3.85s
plot([3.85, 3.85], [0, 100], ...
    '', 'LineWidth', 1.5, 'Color', [0.75, 0.75, 0.75]);

legend('Clutching Phase', 'Low Ratio', 'Shift', '100 ft', '3.85 s', ...
    'Location', 'northwest')

xlim([0, 4]);
ylim([0, 110]);

Acc_385_t = [t'; t(end) + EngageToPower(:, 1); t(end) + EngageToPower(end, 1) + ShiftAcceleration(:, 1)];
Acc_385_x = [x'; x(end) + EngageToPower(:, 2); x(end) + EngageToPower(end, 2) + ShiftAcceleration(:, 2)];
Acc_385 = [Acc_385_t, Acc_385_x];