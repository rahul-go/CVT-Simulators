%% Description
% Simulates low ratio acceleration of the 2018 Baja car using the Briggs
% and Stratton Model 19 engine. Compared with experimental data, this
% script aids in determining the independent effective mass and independent
% effective moment of inertia of the Baja car.



%% Definitions
% * Independent effective mass (m): accounts for translational mass,
% rotational mass, and nonsconservative forces in units of slugs and kg.
% Allows us to use F = m * a in future calculations.
% * Independent effective moment of inertia (I): accounts for translational
% mass, rotational mass, and nonsconservative forces in units of slug*ft^2
% and kg*m^2. Allows us to use T = I * alpha in future calculations.



%% Reset
close all;
clear all;
clc;



%% Constants

% Independent Effective Inertia (TUNE)
m = 1280 / 32.174;                      % Mass (slug)

% Constants
CVT = 2.50;                             % CVT low ratio (tested)
GB = 6.837;                             % Gearbox ratio (high-speed)
RPM_0 = 2200;                           % Lowest RPM after engagement
r = 10 / 12;                            % Effective wheel radius (ft)



%% TODO
% TODO
v_0 = (RPM_0/60) * (2*pi) / (CVT*GB) * r;



%% F = m * a Simulator (Force at Wheels)
% TODO
CarTranslationODE = @(t, x) CarTranslationEOM(t, x, m, CVT, GB, r);
options = odeset('RelTol',1e-9);
[t, y] = ode45(CarTranslationODE, [0 1.2], [0 v_0], options);
x = y(:, 1);
v = y(:, 2);
RPM = (v/r) * (GB*CVT) / (2*pi) * 60;
a = getWheelForce(RPM, CVT, GB, r) / m;

plot(t, x, 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Position (ft)');
title('Low Ratio Position');

figure;
plot(t, v, 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Velocity (ft/s)');
title('Low Ratio Velocity');

figure;
plot(t, a, 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Acceleration(ft/s^2)');
title('Low Ratio Acceleration');

% % Engagement to 3600 RPM time
% for n = 1:length(a)
%     if a(n) == 0
%         stop = n
%         break
%     end
% end
% t(n)

EngageToPower = [t(1:40), x(1:40)];