# Data Report: Impact of Climate-Related Events on Public Support for Climate Action in the United States

## Main Question

Are people living in states with more casualties caused by climate-related events more likely to support countermeasures against climate change?

## Datasources


### 1. Datasource: Storm Events Database 2020
This dataset, published by the NOAA, contains detailed statistics on personal injuries, fatalities, and financial damages caused by weather events in 2020, categorized by U.S. state. It provides a comprehensive and reliable source for quantifying the of climate-related events on humans. The dataset is well-structured and verified, with clear metadata on event types, damages, locations and source of claim and is stored as a csv file. 

Furthermore each row contains information about the source of the reported data entry and more details about the respective weather event which are of lesser importance for this project. It represents all the data of the year 2020 published by the National Centers for Environmental Information (more general, National oceanic and atmospheric administration).

The data published by the National domain-specific data portal of the NOAA and is in a structured form with no missing or problematic values regarding the relevant data.

* Metadata URL: [https://www.ncei.noaa.gov/pub/data/swdi/stormevents/csvfiles/Storm-Data-Bulk-csv-Format.pdf](https://www.ncei.noaa.gov/pub/data/swdi/stormevents/csvfiles/Storm-Data-Bulk-csv-Format.pdf)
* Data URL: [https://www.ncei.noaa.gov/pub/data/swdi/stormevents/csvfiles/StormEvents_details-ftp_v1.0_d2020_c20240620.csv.gz](https://www.ncei.noaa.gov/pub/data/swdi/stormevents/csvfiles/StormEvents_details-ftp_v1.0_d2020_c20240620.csv.gz)
* License: NCEI is part of NOAA, an U.S.A Goverment agency. The NOAA website states that all their data is freely accessible and usable as it's a goverment agency and all goverment data made public by employees in offical duty is freely accessible and redistributable (which this dataset is because "Storm Data is provided by the National Weather Service (NWS) and contain statistics on personal injuries and damage estimates"[https://www.ncdc.noaa.gov/stormevents/details.jsp](https://www.ncdc.noaa.gov/stormevents/details.jsp) (under license). The general policy of NOAA states, that per default the data is openly accessible and usable for everyone unless explicitly stated otherwise (mostly CC0-License) ([https://www.ncei.noaa.gov/archive](https://www.ncei.noaa.gov/archive)). While the dataset does not have a license attachted to it, the data is provided by the NWS through NCEI under NOAA, which shows the author of the data as a goverment offical in offical duty, it's to assume that the data is "open" and freely accessible aswell [https://www.ncei.noaa.gov/sites/g/files/anmtlf171/files/2023-12/NCEI%20PD-10-2-02%20-%20Open%20Data%20Policy%20Signed.pdf](https://www.ncei.noaa.gov/sites/g/files/anmtlf171/files/2023-12/NCEI%20PD-10-2-02%20-%20Open%20Data%20Policy%20Signed.pdf).



### 2. Datasource: Yale Climate Change Opinion Map 2020

This dataset represents the summarized statistics about the public opinion on climate change related question regarding importance, countermeasures, awareness on the topic, etc. It averages the importance from 0% to 100% for each question per U.S. state and on county level in the year of 2020. The data was published and evaluated through polls by the private Yale University through their climate change action program. Each row represents the avg. values for each U.S. state and county with over 30 columns representing a question. The data quality is well structured with no missing values or errors regarding the relevant data collected through a representative study and hence was chosen.



* Metadata URL: [https://raw.githubusercontent.com/yaleschooloftheenvironment/Yale-Climate-Change-Opinion-Maps/refs/heads/main/YCOM5.0_2020_webdata_Metadata.csv](https://raw.githubusercontent.com/yaleschooloftheenvironment/Yale-Climate-Change-Opinion-Maps/refs/heads/main/YCOM5.0_2020_webdata_Metadata.csv)
* Data URL: [https://raw.githubusercontent.com/yaleschooloftheenvironment/Yale-Climate-Change-Opinion-Maps/refs/heads/main/YCOM5.0_2020_webdata_2020-08-19.csv](https://raw.githubusercontent.com/yaleschooloftheenvironment/Yale-Climate-Change-Opinion-Maps/refs/heads/main/YCOM5.0_2020_webdata_2020-08-19.csv)
* Data Type: CSV
* License: MIT License on GitHub issued by Yale officials. Hence it's freely usable for this project [https://github.com/yaleschooloftheenvironment/Yale-Climate-Change-Opinion-Maps](https://github.com/yaleschooloftheenvironment/Yale-Climate-Change-Opinion-Maps). The License is to be included in the project and noted in all corresponding presentations.