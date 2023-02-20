# Pricing under Fairness Concerns: Code and Data

This repository contains the code and data accompanying the article ["Pricing under Fairness Concerns"](https://pascalmichaillat.org/8/), written by [Erik Eyster](https://econ.ucsb.edu/people/faculty/erik-eyster), [Kristof Madarasz](https://www.lse.ac.uk/management/people/academic-staff/kmadarasz), and [Pascal Michaillat](https://pascalmichaillat.org), and published in the [Journal of the European Economic Association](https://doi.org/10.1093/jeea/jvaa041) in June 2021. 

## Figure 1

To produce figure 1, run the Matlab script `figure1.m`. This script calls two Dynare scripts:

* `irfFairnessMonetary.mod` - compute the impulse response functions of the New Keynesian model with fairness under monetary shocks
* `irfTextbookMonetary.mod` - compute the impulse response functions of the textbook New Keynesian model under monetary shocks

The script then produces the six panels of figure 1:

* `figure_1_exogenous_component_of_monetary_policy.pdf` - response of the exogenous component of the monetary-policy rule
* `figure_1_inflation_rate.pdf` - response of the inflation rate
* `figure_1_perceived_price_markup.pdf` - response of the perceived price markup
* `figure_1_actual_price_markup.pdf` - response of the actual price markup
* `figure_1_employment.pdf` - response of employment
* `figure_1_output.pdf` - response of output

## Table 4

Table 4 is produced in the Excel workbook `table4.xlsx`.

## Figure 2

To produce figure 2, run the Matlab script `figure2.m`. This script calls two Dynare scripts:

* `irfFairnessTechnology.mod` - compute the impulse response functions of the New Keynesian model with fairness under technology shocks
* `irfTextbookTechnology.mod` - compute the impulse response functions of the textbook New Keynesian model under technology shocks

The script then produces the six panels of figure 2:

* `figure_2_technology_level.pdf` - response of the technology level
* `figure_2_inflation_rate.pdf` - response of the inflation rate
* `figure_2_perceived_price_markup.pdf` - response of the perceived price markup
* `figure_2_actual_price_markup.pdf` - response of the actual price markup
* `figure_2_employment.pdf` - response of employment
* `figure_2_output.pdf` - response of output

## Figure 3

To produce figure 3, run the Matlab script `figure3.m`. The script produces the two panels of figure 3:

* `figure_3_price_markup.pdf` - long-run Phillips curve in terms of price markup
* `figure_3_employment.pdf` - long-run Phillips curve in terms of employment

## Figure B.1

To produce figure B.1 (in online appendix B), run the Matlab script `figureB1.m`. This script calls one Dynare script:

* `passthrough.mod` - compute the response of a firm's price to a cost shock

The script then produces the figure and saves it as `figure_B1.pdf`.

## Software

The results were obtained on a Mac running macOS Catalina 10.15.6 with the following software:

* Matlab R2020a
* Dynare 4.5.7
* Microsoft Excel 16.16.24

## License

The content of this repository is licensed under the terms of the [MIT License](https://opensource.org/license/mit-license-php/).
