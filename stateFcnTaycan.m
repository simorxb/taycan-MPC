function dxdt = stateFcnTaycan(x, u)

%% Car params

m = 2140;
CdA = 0.513;
rho = 1.293;

b = 0.5*CdA*rho;

% Speed axis for lookup table
v_to_F_max_lu = [0 72];

% F max for lookup table
F_max_lu = [22000 1710];

F_min = -20000;

% Assign variables
v = x;
F = u;

% Find max force
F_max = interp1(v_to_F_max_lu, F_max_lu, v, 'linear');

% Limit F
F = min(F, F_max);
F = max(F, F_min);

dv = (F - v^2*b)/m;

dxdt = dv;

end

