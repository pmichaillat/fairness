%% passthrough.mod
%
% This script computes price dynamics used in figureB1.m.
%
%% Description
%
% The script computes the response of an individual firm from the New Keynesian model with fairness to a permanent increase in marginal cost. 
% 
%% Model variables
%
% * P = price
% * M = actual markup 
% * Y = output
% * Mp = perceived markup
% * E = price elasticity of demand
%
%% Model shock
%
% * C = marginal cost
%
%% ----------------------------------------

%% ---------- Declare variables & shocks & parameters ----------

var P M Y Mp E;
varexo C;
parameters delta theta gamma epsilon;

%% ---------- Calibrate parameters (table 3) ----------

% Discount factor
delta = 0.99;

% Fairness concern
theta = 9;

% Degree of underinference
gamma = 0.8;

% Elasticity of substitution across goods

epsilon = (1.5/(1.5-1))/(1+(1-delta)*gamma*theta/(1-delta*gamma));

% Display results of calibration

fprintf('The fairness concern is theta = %g.\n',theta);
fprintf('The degree of underinference is gamma = %g.\n',gamma);
fprintf('The elasticity of substitution across goods is epsilon = %.2f.\n',epsilon);

%% ------- Declare pricing model with fairness (online appendix B.5) --------

model;

% Fairness function
# F = 1-theta*(Mp-epsilon/(epsilon-1));

% Elasticity of fairness function
# phi = theta*Mp/F;

% Price elasticity of demand
E = epsilon+(epsilon-1)*gamma*phi;

% Pricing equation
E*(M-1)/M = 1+delta*((Y(+1)*P(+1))/(Y*P)*(((M(+1)-1)/M(+1))*(E(+1)-(1-gamma)*epsilon)-gamma)); 

% Markup definition
M = P/C;

% Demand curve
Y = F*P^(-epsilon);

% Law of motion of perceived markup
Mp = (epsilon/(epsilon-1))^(1-gamma)*(P/P(-1))^(gamma)*Mp(-1)^(gamma);

end;

%% ---------- Declare initial and terminal conditions ----------

% Initial value for C & guess values for endogenous variables
initval; 
C = 1; 
P = 1.5;
M = 1.5;
Y = 1.5^(-epsilon);
Mp = epsilon/(epsilon-1);
E = epsilon*(1+gamma*theta);
end;

% Compute steady state associated with initial value of C
steady;

% Terminal value for C & guess values for endogenous variables
endval; 
C = 1.01; 
P = 1.5*1.01;
M = 1.5;
Y = (1.5*1.01)^(-epsilon);
Mp = epsilon/(epsilon-1);
E = epsilon*(1+gamma*theta);
end;

% Compute steady state associated with terminal value of C
steady;

%% ---- Compute perfect-foresight response to cost increase at t=1 ----------

simul(periods=400);