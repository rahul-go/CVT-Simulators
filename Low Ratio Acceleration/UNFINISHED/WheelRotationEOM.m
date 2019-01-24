function [ xdot ] = WheelRotationEOM( t, x, I, CVT, GB, r)
% TODO

RPM = x(2) * (GB*CVT) / (2*pi) * 60;

xdot = [x(2);
        getWheelTorque(RPM, CVT, GB) / I];
end