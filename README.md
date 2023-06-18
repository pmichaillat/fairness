# Pricing under Fairness Concerns: Code and Data

This repository contains the code and data accompanying the paper "Pricing under Fairness Concerns", written by [Erik Eyster](https://econ.ucsb.edu/people/faculty/erik-eyster), [Kristof Madarasz](https://www.lse.ac.uk/management/people/academic-staff/kmadarasz), and [Pascal Michaillat](https://pascalmichaillat.org), and published in the [Journal of the European Economic Association](https://doi.org/10.1093/jeea/jvaa041) in June 2021. 

## Paper webpage

The paper and its online appendix are available at https://pascalmichaillat.org/8/.

## Figure 1

Figure 1 is produced by the MATLAB script `figure1.m`. 

This script calls two Dynare scripts:

+ `irfFairnessMonetary.mod` – Compute the impulse response functions of the New Keynesian model with fairness under monetary shocks
+ `irfTextbookMonetary.mod` – Compute the impulse response functions of the textbook New Keynesian model under monetary shocks

The script then produces the six panels of figure 1:

+ `figure_1_exogenous_component_of_monetary_policy.pdf` – Response of the exogenous component of the monetary-policy rule
+ `figure_1_inflation_rate.pdf` – Response of the inflation rate
+ `figure_1_perceived_price_markup.pdf` – Response of the perceived price markup
+ `figure_1_actual_price_markup.pdf` – Response of the actual price markup
+ `figure_1_employment.pdf` – Response of employment
+ `figure_1_output.pdf` – Response of output

## Table 4

Table 4 is produced in the Excel workbook `table4.xlsx`.

## Figure 2

Figure 2 is produced by the MATLAB script `figure2.m`. 

This script calls two Dynare scripts:

+ `irfFairnessTechnology.mod` – Compute the impulse response functions of the New Keynesian model with fairness under technology shocks
+ `irfTextbookTechnology.mod` – Compute the impulse response functions of the textbook New Keynesian model under technology shocks

The script then produces the six panels of figure 2:

+ `figure_2_technology_level.pdf` – Response of the technology level
+ `figure_2_inflation_rate.pdf` – Response of the inflation rate
+ `figure_2_perceived_price_markup.pdf` – Response of the perceived price markup
+ `figure_2_actual_price_markup.pdf` – Response of the actual price markup
+ `figure_2_employment.pdf` – Response of employment
+ `figure_2_output.pdf` – Response of output

## Figure 3

Figure 3 is produced by the MATLAB script `figure3.m`. The script produces the two panels of figure 3:

+ `figure_3_price_markup.pdf` – Long-run Phillips curve in terms of price markup
+ `figure_3_employment.pdf` – Long-run Phillips curve in terms of employment

## Figure B.1

Figure B.1 (in online appendix B) is produced by the MATLAB script `figureB1.m`. 

This script calls one Dynare script:

+ `passthrough.mod` – Compute the response of a firm's price to a cost shock

The script then produces the figure and saves it as `figure_B1.pdf`.

## Software

The results were obtained on a Mac running macOS Catalina 10.15.6 with the following software:

+ MATLAB R2020a
+ Dynare 4.5.7
+ Microsoft Excel 16.16.24

## License

The content of this repository is licensed under the terms of the MIT License.
