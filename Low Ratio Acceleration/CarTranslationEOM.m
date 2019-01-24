function [ xdot ] = CarTranslationEOM( t, x, m, CVT, GB, r)
% TODO

RPM = (x(2)/r) * (GB*CVT) / (2*pi) * 60;

xdot = [x(2);
        getWheelForce(RPM, CVT, GB, r) / m];
end