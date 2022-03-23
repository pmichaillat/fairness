%% figure3.m
%
% This script produces the two panels of figure 3.
%
%% Description
%
% The script computes two long-run Phillips curves in the New Keynesian model with fairness:
% 
% * The first Phillips curve links steady-state inflation to steady-state price markup.
% * The second Phillips curve links steady-state inflation to steady-state employment.
% 
% The script then displays the two curves for various degrees of acclimation.
%
%% ----------------------------------------

close all;
clear;
clc;

%% ---------- Specify parameters & variables & functions ----------

% Discount factor (table 3)
delta = 0.99;

% Inverse of Frisch elasticity of labor supply (table 3)
eta = 1.1;

% Elasticity of substitution across goods (table 3)
epsilon = 2.23;

% Fairness concern (table 3)
theta = 9;

% Degree of underinference (table 3)
gamma = 0.8;

% Range of inflation rates
pi = [-0.01:0.0001:0.01];

% Range of degrees of acclimation
chi = [0,0.3,0.7,1]; 

% Perceived price markup (lemma 7)
Mp = @(pi) epsilon/(epsilon-1)*exp(gamma./(1-gamma).*pi);

% Fairness function (lemma 7)
F = @(pi,chi) max(0,1-theta.*(1-chi).*(Mp(pi)-epsilon./(epsilon-1)));

% Elasticity of fairness function (lemma 7)
phi = @(pi,chi) max(0,theta.*Mp(pi)./F(pi,chi));

%% ---------- Compute long-run Phillips curves ----------

%% Phillips curve in terms of price markup (proposition 3)

% Express markup as a function of inflation and acclimation
M = @(pi,chi) 1+1./((epsilon-1).*(1+(1-delta)*gamma./(1-delta*gamma).*phi(pi,chi)));

% Compute markup over inflation range, for chi = 0
MNoAcclimation = M(pi,chi(1));

% Compute markup over inflation range, for chi = 0.3
MLowAcclimation = M(pi,chi(2));

% Compute markup over inflation range, for chi = 0.7
MHighAcclimation = M(pi,chi(3));

% Compute markup over inflation range, for chi = 1
MFullAcclimation = M(pi,chi(4));

%% Phillips curve in terms of employment (proposition 3)

% Price markup at zero inflation (for any degree of acclimation)
MNoInflation = M(0,0);

% Compute log deviation of employment from zero inflation, for chi = 0
nNoAcclimation = (log(MNoInflation) - log(MNoAcclimation))./(1+eta);

% Compute log deviation of employment from zero inflation, for chi = 0.3
nLowAcclimation = (log(MNoInflation) - log(MLowAcclimation))./(1+eta);

% Compute log deviation of employment from zero inflation, for chi = 0.7
nHighAcclimation = (log(MNoInflation) - log(MHighAcclimation))./(1+eta);

% Compute log deviation of employment from zero inflation, for chi = 1
nFullAcclimation = (log(MNoInflation) - log(MFullAcclimation))./(1+eta);

%% ---------- Format graphics ----------

%% Set default properties

set(groot,'DefaultFigureUnits', 'inches')
set(groot,'DefaultFigurePosition', [1,1,7.7779,5.8334]);
set(groot,'DefaultFigurePaperPosition', [0, 0, 7.7779,5.8334]);
set(groot,'DefaultFigurePaperSize', [7.7779,5.8334]);

set(groot,'DefaultAxesFontName', 'Helvetica')
set(groot,'DefaultAxesFontSize', 15)
set(groot,'defaultAxesLabelFontSizeMultiplier',1)
set(groot,'defaultAxesTitleFontSizeMultiplier',1)
set(groot,'defaultAxesTitleFontWeight','normal')
set(groot,'DefaultAxesXColor','k')
set(groot,'DefaultAxesYColor','k')
set(groot,'DefaultAxesGridColor','k')
set(groot,'DefaultAxesLineWidth', 1)
set(groot,'DefaultAxesXGrid','on')
set(groot,'DefaultAxesYGrid','on')
set(groot,'DefaultAxesTickLength',[0 0])

set(groot,'DefaultLineLineWidth', 2)

%% Pick color palette

lightestBlue = '#c6dbef';
lightBlue = '#6baed6';
darkBlue = '#2171b5';
darkestBlue = '#08306b';

%% --- Plot long-run Phillips curves for various degrees of acclimation ------

%% Annualize the inflation rate

pi = 4.*pi;

%% Phillips curve in terms of price markup

figure(1)
clf
hold on

plot(MNoAcclimation,pi,'Color',lightestBlue)
plot(MLowAcclimation,pi,'Color',lightBlue)
plot(MHighAcclimation,pi,'Color',darkBlue)
plot(MFullAcclimation,pi,'Color',darkestBlue)

set(gca,'XTick',[1.4:0.05:1.6],'Xlim',[1.4,1.6])
set(gca,'YTick',[-0.02:0.01:0.02],'Ylim',[-0.02,0.02],'YTickLabel',['-2%';'-1%';' 0%';' 1%';' 2%'])
xlabel('Price markup')
ylabel('Inflation rate')
print('-dpdf',['figure_3_price markup.pdf'])

%% Phillips curve in terms of employment

figure(2)
clf
hold on

plot(nNoAcclimation,pi,'Color',lightestBlue)
plot(nLowAcclimation,pi,'Color',lightBlue)
plot(nHighAcclimation,pi,'Color',darkBlue)
plot(nFullAcclimation,pi,'Color',darkestBlue)

set(gca,'XTick',[-0.02:0.01:0.03],'Xlim',[-0.02,0.03],'XTickLabel',['-2%';'-1%';' 0%';' 1%';' 2%';' 3%'])
set(gca,'YTick',[-0.02:0.01:0.02],'Ylim',[-0.02,0.02],'YTickLabel',['-2%';'-1%';' 0%';' 1%';' 2%'])
xlabel('Employment')
ylabel('Inflation rate')
print('-dpdf',['figure_3_employment.pdf'])