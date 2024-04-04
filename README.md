# Work-Injury Policy: Chapter in the Social Policy Atlas

[Nate Breznau](https://sites.google.com/site/nbreznau/) and Felix Lanver, University of Bremen
(Breznau is contact author [breznau.nate@gmail.com](mailto:breznau.nate@gmail.com))

Communism and Enslaved Labor in the Global Development of Work Accident Insurance

## Workflow

The dataset used in the maps and analysis is compiled using the subroutine [dataframe_setup_workflow_explanation.Rmd](../data/dataframe_setup/ataframe_setup_workflow_explanation.Rmd)

The maps are generated using [A_Workflow_Maps.Rmd](https://github.com/nbreznau/work_injury_atlas/blob/main/A_Workflow_Maps.Rmd)

The regression results and Figure are generated using [B_Workflow_Regressions.Rmd](https://github.com/nbreznau/work_injury_atlas/blob/main/B_Workflow_Regressions.Rmd)

Users can view the workflow documentation using their browser:
* [Generate Maps](https://raw.githack.com/nbreznau/work_injury_atlas/main/A_Workflow_Maps.html)
* [Run Regressions](https://raw.githack.com/nbreznau/work_injury_atlas/main/B_Workflow_Regressions.html)

## Data Sources

*gwip_v1.csv* ([Breznau and Lanver 2020](https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/IVKYIE))

*mpd2018.csv* ([Maddison 2018](http://www.ggdc.net/maddison/maddison-project/home.htm), with author interpolations (see below))

*data_legal_slavery_country.csv* (Rosling 2020) - adapted and updated by Nate Breznau

*qog_bas_cs_jan20.csv* ([Dahlberg et al. 2020](http://www.qog.pol.gu.se doi:10.18157/qogbasjan20))

*data/fmrcmnst.csv* Former Communist/Socialist - author's own coding

*PolityData.rds* ([Polity IV scores](http://www.systemicpeace.org/)) Saved as this file to preserve replicability (as Polity scores get updated regularly)

## MPSA 2024 Presentation

[Link to pptx](https://docs.google.com/presentation/d/1jdTfvIIrNijWCUXMMsIq6Vh8IYWxlw_R/edit?usp=sharing&ouid=105191535830555378336&rtpof=true&sd=true)
