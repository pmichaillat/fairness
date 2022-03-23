%% figureB1.m
%
% This script produces figure B.1 (in online appendix B).
%
%% Description
%
% The script computes the response of an individual firm's price to a permanent increase in marginal cost in the New Keynesian model with fairness.
% 
% The script then displays the dynamics of the cost passthrough.
%
%% ----------------------------------------

close all;
clear;
clc;

%% ---------- Compute passthrough dynamics using Dynare ----------

% Compute firm's response to a permanent increase in marginal cost
dynare passthrough.mod

% Extract price dynamics
P = oo_.endo_simul(1,:);

% Compute passthrough dynamics
beta = (P(2:end)-P(1))./P(1).*100;

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
set(groot,'DefaultAxesXGrid','off')
set(groot,'DefaultAxesYGrid','on')
set(groot, 'defaultAxesTickDirMode', 'manual')
set(groot,'defaultAxesTickLength',[0.01 0.025])
set(groot, 'defaultAxesTickDir', 'out')

set(groot,'DefaultLineLineWidth',2)

%% Pick color palette

blue = '#386cb0';

%% ---------- Plot passthrough dynamics ----------

horizon = [0:1:16];

figure(1)
clf
hold on

plot(horizon,beta(horizon+1),'Color',blue)

set(gca,'XLim',[0,16],'XTick',[0:4:16],'XTickLabel',['0';'1';'2';'3';'4'])
xlabel('Years')
set(gca,'YLim',[0,1],'YTick',[0:0.2:1])
ylabel('Cost passthrough')
print('-dpdf',['figure_B1.pdf'])