function dxdt = stateFcnTaycan(x, u)
% State function for Taycan vehicle dynamics model
% Inputs:
%   x: Current vehicle speed (m/s)
%   u: Force input command (N)
% Output:
%   dxdt: Rate of change of vehicle speed (m/s^2)

%% Vehicle Parameters
% Vehicle mass (kg)
m = 2140;
% Drag coefficient * Frontal area (m^2)
CdA = 0.513;
% Air density (kg/m^3)
rho = 1.293;

% Combined aerodynamic drag coefficient (kg/m)
b = 0.5*CdA*rho;

% Lookup table for maximum force vs speed
% Speed points (m/s)
v_to_F_max_lu = [0 72];
% Maximum force points (N) - decreases with speed
F_max_lu = [22000 1710];
% Minimum force (N) - maximum braking force
F_min = -20000;

% Extract current state and input
v = x;  % Vehicle speed (m/s)
F = u;  % Force command (N)

% Calculate speed-dependent maximum force limit
F_max = interp1(v_to_F_max_lu, F_max_lu, v, 'linear');

% Apply force limits
F = min(F, F_max);  % Limit to maximum force
F = max(F, F_min);  % Limit to minimum force

% Calculate acceleration (F = ma + drag)
dv = (F - v^2*b)/m;  % Net acceleration considering force and drag

dxdt = dv;

end

