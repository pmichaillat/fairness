%% irfFairnessTechnology.mod
%
% This script computes impulse response functions (IRFs) used in figure2.m.
%
%% Description
%
% The script computes IRFs to a positive technology shock in the New Keynesian model with fairness. 
% 
%% Model variables
%
% * i0 = exogenous component of monetary-policy rule
% * a = log technology level
% * i = nominal interest rate
% * pi = inflation rate
% * mp = log perceived price markup 
% * m = log actual price markup
% * n = log employment 
% * y = log output
%
% All variables are measured as deviation from their steady-state values.
%
%% Model shocks
%
% * zetai = monetary shock
% * zetaa = technology shock
%
%% ----------------------------------------

%% ---------- Declare variables & shocks & parameters ----------

var i0 a i pi mp m n y;
varexo zetai zetaa;
parameters delta alpha eta psi mua mui theta gamma epsilon;

%% ---------- Calibrate parameters (table 3) ----------

% Discount factor
delta = 0.99;

% Shape of production function
alpha = 1;

% Inverse of Frisch elasticity of labor supply
eta = 1.1;

% Response of nominal interest rate to inflation
psi = 1.5;

% Persistence of monetary shock
mui = 0.75;

% Persistence of technology shock
mua = 0.9;

% Fairness concern
theta = 9;

% Degree of underinference
gamma = 0.8;

% Elasticity of substitution across goods
epsilon = 2.23;

%% --- Declare New Keynesian model with fairness (online appendix B.4) --------

% Use log-linearized equilibrium conditions 
model(linear);

% Steady-state elasticity and superelasticity of fairness function
# phi = theta*epsilon/(epsilon-1);
# sigma = 1+(theta*epsilon/(epsilon-1));

% Coefficients in short-run Phillips curve
# lambda1 = (1+eta)*(epsilon+(epsilon-1)*gamma*phi)/(gamma*phi*sigma)*(1+(1-delta)/(1-delta*gamma)*gamma*phi);
# lambda2 = (1+eta)*delta*(epsilon+(epsilon-1)*phi)/(phi*sigma)*(1+(1-delta)/(1-delta*gamma)*gamma*phi);

% Law of motion of exogenous component of monetary-policy rule (section 5.4)
i0 = mui*i0(-1)-zetai;

% Law of motion of technology level (section 5.5)
a = mua*a(-1)+zetaa;

% Monetary-policy rule
i = i0+psi*pi;

% Production function
y = a+alpha*n;

% Markup-employment relation
m = -(1+eta)*n;

% Law of motion of perceived markup
mp = gamma*pi+gamma*mp(-1);

% Consumption Euler equation
y+i = y(+1)+pi(+1);

% Short-run Phillips curve
lambda1*n = (1-delta*gamma)*mp-delta*gamma*pi(+1)+lambda2*n(+1); 

end;

%% ---------- Compute steady state & specify technology shock ----------

steady;

shocks;
var zetaa;
stderr 1;
end;

%% ---------- Compute IRFs ----------

stoch_simul(noprint,nodisplay) a pi mp m n y;