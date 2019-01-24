function [T] = getEngineTorque(RPM)

% Find HP at RPM
HP = getEnginePower(RPM);

% Torque = Power / Angular Velocity
T = HP ./ (RPM*2*pi) * 33000;

% TODO
T(RPM > 3600) = 0;

end                         

%% References:
% * BSM19 Engine Power/Torque Google Sheet [CVT 2019]