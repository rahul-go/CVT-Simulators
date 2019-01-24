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
I = 16;                                 % Moment of Inertia (slug*ft^2)

% Reduction Ratios
CVT = 3.0;                              % CVT Low Ratio (Theoretical)
GB = 6.579;                             % Gearbox Ratio (High-Speed)

% Miscellaneous
RPM_0 = 2000;                           % Lowest RPM after engagement



%% TODO
% TODO
omega_0 = (RPM_0/60) * (2*pi) / (CVT*GB);



%% T = I * alpha Simulator (Torque at Wheels)
% TODO
WheelRotationODE = @(t, x) WheelRotationEOM(t, x, I, CVT, GB);
[t, y] = ode45(WheelRotationODE, [0 1], [0 omega_0]);
theta = y(:, 1);
omega = y(:, 2);
RPM = omega * (GB*CVT) / (2*pi) * 60;
alpha = getWheelTorque(RPM, CVT, GB) / I;

plot(t, theta);
figure;
plot(t, omega);
figure;
plot(t, alpha);