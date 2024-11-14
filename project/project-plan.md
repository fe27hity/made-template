# Project Plan

## Title
<!-- Give your project a short title. -->
Impact of Climate-Related Events on Public Support for Climate Action in the United States

## Main Question

<!-- Think about one main question you want to answer based on the data. -->
1. Are individuals living in areas with a higher number of direct and indirect casualties from climate-related events more supportive for climate change countermeasures?


## Description

<!-- Describe your data science project in max. 200 words. Consider writing about why and how you attempt it. -->
Climate change is a global issue, and large emitters like the U.S. play a critical role in addressing it. However, political division complicates action, as major parties have opposing views on climate change. The median voter’s stance varies significantly, and personal motivations is not fully clear yet. This project aims to explore whether individuals living in areas that are more affected by consequences and casualties of climate-related events (e.g., tornadoes, storms, floods; and weather / storm events which are increased in their frequency by climate change) are more likely to prioritize climate change as a personal and political concern.

This project analysizes the relationship between the casualties caused directly and indirectly by weather events (e.g. storms) and the respective public opinion about the importance of climate change as a political topic per U.S state. To see whether there might be a connection between those variable a correlation analysis is choosen as the scientific method.

## Datasources

<!-- Describe each datasources you plan to use in a section. Use the prefic "DatasourceX" where X is the id of the datasource. -->

### Datasource1: Storm Events Database 2020
* Metadata URL: [https://www.ncei.noaa.gov/pub/data/swdi/stormevents/csvfiles/Storm-Data-Bulk-csv-Format.pdf](https://www.ncei.noaa.gov/pub/data/swdi/stormevents/csvfiles/Storm-Data-Bulk-csv-Format.pdf)
* Data URL: [https://www.ncei.noaa.gov/pub/data/swdi/stormevents/csvfiles/StormEvents_details-ftp_v1.0_d2020_c20240620.csv.gz](https://www.ncei.noaa.gov/pub/data/swdi/stormevents/csvfiles/StormEvents_details-ftp_v1.0_d2020_c20240620.csv.gz)
* Data Type: CSV
* License: NCEI is part of NOAA, an U.S.A Goverment agency. The NOAA website states that all their data is freely accessible and usable as it's a goverment agency and all goverment data made public by employees in offical duty is freely accessible and redistributable (which this dataset is because "Storm Data is provided by the National Weather Service (NWS) and contain statistics on personal injuries and damage estimates", [https://www.ncei.noaa.gov/archive](https://www.ncei.noaa.gov/archive)).

This dataset represents the summarized statistics about the financial damages and quantified damages of property aswell as fataliities / casualties. Furthermore the data contains information about the source of the reported data entry and more details about the respective weather event which are of lesser importance. The damages are grouped by county and states. It represents all the data of the year 2020 published by the National Centers for Environmental Information (National oceanic and atmospheric administration).

### Datasource2: Yale Climate Change Opinion Map 2020
* Metadata URL: [https://raw.githubusercontent.com/yaleschooloftheenvironment/Yale-Climate-Change-Opinion-Maps/refs/heads/main/YCOM5.0_2020_webdata_Metadata.csv](https://raw.githubusercontent.com/yaleschooloftheenvironment/Yale-Climate-Change-Opinion-Maps/refs/heads/main/YCOM5.0_2020_webdata_Metadata.csv)
* Data URL: [https://raw.githubusercontent.com/yaleschooloftheenvironment/Yale-Climate-Change-Opinion-Maps/refs/heads/main/YCOM5.0_2020_webdata_2020-08-19.csv](https://raw.githubusercontent.com/yaleschooloftheenvironment/Yale-Climate-Change-Opinion-Maps/refs/heads/main/YCOM5.0_2020_webdata_2020-08-19.csv)
* Data Type: CSV
* License: MIT License on GitHub

This dataset represents the summarized statistics about the public opinion on climate change related question regarding importance, countermeasures, awareness on the topic, etc. It averages the importance from 0% to 100% for each question per U.S. state in the year of 2020. The data was published and evaluated through polls by the private Yale University through their climate change action program.

## Work Packages

<!-- List of work packages ordered sequentially, each pointing to an issue with more details. -->

1. Familiarize with data sets  [#1][i1]
2. Creation of a Project Plan  [#2][i2]
3. Creation of a Project Data Pipeline  [#3][i3]
4. Finalizing the Project's Data Report  [#4][i4]
5. Introduction of Automated Testing  [#5][i5]
6. Introduction of Continuous Integration  [#6][i6]
7. Finalizing the Project's Final Report  [#7][i7]

[i1]: https://github.com/fe27hity/made-template/issues/1
[i2]: https://github.com/fe27hity/made-template/issues/2
[i3]: https://github.com/fe27hity/made-template/issues/3
[i4]: https://github.com/fe27hity/made-template/issues/4
[i5]: https://github.com/fe27hity/made-template/issues/5
[i6]: https://github.com/fe27hity/made-template/issues/6
[i7]: https://github.com/fe27hity/made-template/issues/7
