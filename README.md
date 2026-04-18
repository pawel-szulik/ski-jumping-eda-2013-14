# Ski Jumping EDA

## General Information
This was a final project for an "Introduction to Data Analysis" course at 3rd semester of my studies. It's an Exploratory Data Analysis of the 2013/14 Men's Winter Ski jumping season. It involves basic data preprocessing and statistical analysis of the visualized results.

I started it back in January, and decided to put it on GitHub in April with the intention of making it more visually pleasing.

The analysis was conducted in Polish, while the documentation was prepared in English for broader accessibility.

## Technologies Used
* **R 4.5.0**
* **tidyverse** (dplyr, ggplot2, tidyr)
* **other packages** corrplot, psych
* **knitr** & **rmarkdown**
* **RStudio**

## Features
* **Data Preprocessing**: Cleaning and transforming raw data from a few different files into one usable dataset.
* **Custom metric**: Created a custom metric 'dist_prop', which is a ratio of the jump to hill's k point, to normalize different hill sizes (KEY for my analysis)
* **Visualization**: Used histograms, density plots, barplots, boxplots and corrplots to visualize the data.
* **Analysis**: Performed an analysis of the obtained results.

## Project Structure
```text
ski-jumping-eda/
│
├── data/
│   ├── all_comps.csv
│   ├── all_names.csv
│   ├── all_results.csv
│   └── all_stats.csv
│
├── docs/
│   └── index.html
│
├── ski_jumping_EDA.Rmd
├── ski_jumping_EDA.Rproj
├── .gitignore
├── .gitattributes
└── README.md
```
## Setup
The project requires R and RStudio. To reproduce the analysis:

1. Clone the repository.

2. Open ski_jumping_EDA.Rproj.

3. Install the required packages:

```r
install.packages(c("tidyverse", "psych", "corrplot"))
```
4. Open ski_jumping_EDA.Rmd and click the Knit button to generate the report.

## Data Source
The data was used from a kaggle dataset: https://www.kaggle.com/datasets/wrotki8778/ski-jumping-results-database-2009now
