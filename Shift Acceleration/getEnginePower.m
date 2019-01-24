function [HP] = getEnginePower(RPM)
% BSM19 Engine HP vs. RPM Equation  (3rd Order)
HP = - 2.874 * 10^-10 * RPM.^3 ...
     + 1.781 * 10^-06 * RPM.^2 ...
     - 6.842 * 10^-04 * RPM.^1 ...
     + 1.719 * 10^000 * RPM.^0;
end

%% References:
% * BSM19 Engine Power/Torque Google Sheet [CVT 2019]