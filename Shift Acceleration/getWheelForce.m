function [F] = getWheelForce(RPM, CVT, GB, r)
% TODO
F = getWheelTorque(RPM, CVT, GB) / r;
end