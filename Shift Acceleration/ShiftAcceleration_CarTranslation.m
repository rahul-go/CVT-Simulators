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
RPM = 3600;                             % Peak engine power PRM
CVT_L = 2.50;                           % CVT low ratio (tested)
GB = 6.837;                             % Gearbox ratio (high-speed)
r = 10 / 12;                            % Effective wheel radius (ft)



%% TODO
% TODO
v_0 = (RPM/60) * (2*pi) / (CVT_L*GB) * r;



%% F = m * a Simulator (Force at Wheels)
% TODO
CarTranslationODE = @(t, x) CarTranslationEOM(t, x, m, RPM, GB, r);
[t, y] = ode45(CarTranslationODE, 0:0.01:10, [0 v_0]);
x = y(:, 1);
v = y(:, 2);
% RPM = (v/r) * (GB*CVT) / (2*pi) * 60;
% a = getWheelForce(RPM, CVT, GB, r) / m;

plot(t, x);
figure;
plot(t, v);
figure;
% plot(t, a);

ShiftAcceleration = [t(1:358), x(1:358)];