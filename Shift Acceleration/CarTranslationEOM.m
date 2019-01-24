function [ xdot ] = CarTranslationEOM( t, x, m, RPM, GB, r)
% TODO

CVT = (RPM/60)*(2*pi) / (x(2)/r * GB);

t
getWheelForce(RPM, CVT, GB, r) / m
CVT

xdot = [x(2);
        getWheelForce(RPM, CVT, GB, r) / m];
end