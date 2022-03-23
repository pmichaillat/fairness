%% figure1.m
%
% This script produces the six panels of figure 1.
%
%% Description
%
% The script computes the effects of an expansionary monetary shock in two New Keynesian models:
%
% * New Keynesian model with fairness
% * Textbook New Keynesian model
% 
% It computes the impulse response functions (IRFs) for six variables:
%
% * Exogenous component of monetary policy
% * Inflation rate
% * Perceived price markup 
% * Actual price markup
% * Employment 
% * Output
% 
% The script then displays the six IRFs for the two models.
%
%% ----------------------------------------

close all;
clear;
clc;

%% ---------- Compute IRFs using Dynare ----------

%% IRFs for New Keynesian model with fairness

dynare irfFairnessMonetary.mod
irfFairness = cell2mat(struct2cell(oo_.irfs));

%% IRFs for textbook New Keynesian model

dynare irfTextbookMonetary.mod
irfTextbook = cell2mat(struct2cell(oo_.irfs));

%% Annualize exogenous component of monetary policy & inflation rate

irfFairness([1,2],:) = 4.*irfFairness([1,2],:); 
irfTextbook([1,2],:) = 4.*irfTextbook([1,2],:);

%% ---------- Format graphics ----------

%% Set default properties

set(groot,'DefaultFigureUnits', 'inches')
set(groot,'DefaultFigurePosition', [1,1,7.7779,5.8334]);
set(groot,'DefaultFigurePaperPosition', [0, 0, 7.7779,5.8334]);
set(groot,'DefaultFigurePaperSize', [7.7779,5.8334]);

set(groot,'DefaultAxesFontName', 'Helvetica')
set(groot,'DefaultAxesFontSize', 22)
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

set(groot,'DefaultLineLineWidth', 3)

%% Pick color palette

blue = '#386cb0';
orange = '#bf5b17';

%% ---------- Plot IRFs for all variables ----------

horizon = [0:1:12];
variable = {'Exogenous component of monetary policy','Inflation rate','Perceived price markup','Actual price markup','Employment','Output'};
nVariable = length(variable);

for iVariable = 1:nVariable

	figure(iVariable)
	clf
	hold on

	% Plot IRF in model with fairness 
	plot(horizon,irfFairness(iVariable,horizon+1),'-','DisplayName','New Keynesian model with fairness','Color',blue)

	% Plot IRF in textbook model
	plot(horizon,irfTextbook(iVariable,horizon+1),'-.','DisplayName','Textbook New Keynesian model','Color',orange)

	% Populate y-axis
	set(gca,'YLim',[-1.5,1],'YTick',[-1.5:0.5:1],'YTickLabel',['-1.5%';'  -1%';'-0.5%';'   0%';' 0.5%';'   1%']);	
	ylabel(variable(iVariable))

	% Populate x-axis
	if iVariable<5
		set(gca,'XLim',[0,12],'XTick',[0:4:12],'XTickLabel',[])
	else
		set(gca,'XLim',[0,12],'XTick',[0:4:12],'XTickLabel',['0';'1';'2';'3'])
		xlabel('Years')
	end

	% Populate caption
	if iVariable==1
		legend('show','Location','northeast')
	else
		legend('off')
	end

	% Print figure as PDF
	name = lower(regexprep(variable{iVariable},' ','_'));
	print('-dpdf',['figure_1_',name,'.pdf'])

end