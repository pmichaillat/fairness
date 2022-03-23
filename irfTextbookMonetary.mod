%% irfTextbookMonetary.mod
%
% This script computes impulse response functions (IRFs) used in figure1.m.
%
%% Description
%
% The script computes IRFs to an expansionary monetary shock in the textbook New Keynesian model. 
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
parameters delta alpha eta psi mui mua epsilon xi;

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

% Elasticity of substitution across goods
epsilon = 3;

% Share of firms keeping price unchanged 
xi = 0.67;

%% ------ Declare textbook New Keynesian model (online appendix C) ----------

% Use log-linearized equilibrium conditions 
model(linear);

% Coefficient in short-run Phillips curve
# kappa = (1+eta)*(1-xi)*(1-delta*xi)*alpha/(xi*(alpha+(1-alpha)*epsilon));

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

% Markups are correctly perceived
mp = m;

% Consumption Euler equation
y+i = y(+1)+pi(+1);

% Short-run Phillips curve
pi = delta*pi(+1)+kappa*n; 

end;

%% ---------- Compute steady state & specify monetary shock ----------

steady;

shocks;
var zetai;
stderr 0.25;
end;

%% ---------- Compute IRFs ----------

stoch_simul(noprint,nodisplay) i0 pi mp m n y;