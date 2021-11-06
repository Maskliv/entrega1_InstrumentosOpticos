function [planeWaveProfile] = plane_wave2D(waveLength,angleDegrees, phase, xRange,yRange)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
k = 2*pi/waveLength;
[X,Y] = meshgrid(xRange,yRange);
alpha = cos(deg2rad(angleDegrees));
beta = sin(deg2rad(angleDegrees));
planeWaveProfile = sin( k * (X*alpha+Y*beta)+phase);
end