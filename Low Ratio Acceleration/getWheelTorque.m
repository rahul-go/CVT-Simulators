function [ T ] = getWheelTorque(RPM, CVT, GB)
% TODO
T = getEngineTorque(RPM) * CVT * GB;
end