%% Car params

m = 2140;
CdA = 0.513;
rho = 1.293;

b = 0.5*CdA*rho;

% Speed axis for lookup table
v_to_F_max = [0 72];

% F max for lookup table
F_max = [22000 1710];

F_min = -20000;

%% Non linear MPC object

% number of states
nx = 1;

% Number of outputs
ny = 1;

% Number of control inputs
nu = 1;

% Nonlinear MPC object
nlobj = nlmpc(nx,ny,nu);

% MPC sample time
Ts = 1;
nlobj.Ts = Ts;

% Horizons
nlobj.PredictionHorizon = 20; % 20 seconds
nlobj.ControlHorizon = 10; % 10 seconds

nlobj.Model.StateFcn = "stateFcnTaycan";

nlobj.ManipulatedVariables.Max = F_max(1);
nlobj.ManipulatedVariables.Min = F_min;

nlobj.Weights.OutputVariables = 1;
nlobj.Weights.ManipulatedVariables = 0;
nlobj.Weights.ManipulatedVariablesRate = 0.002;

x0 = 10;
u0 = 500;
validateFcns(nlobj, x0, u0, [], {});