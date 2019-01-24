function [ xdot ] = EngineRotationEOM( t, x, I, CVT, GB, r)
% TODO

RPM = x(2) * (GB*CVT) / (2*pi) * 60;

xdot = [x(2);
        getEngineTorque(RPM) / I];
end