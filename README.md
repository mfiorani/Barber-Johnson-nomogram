# Barber-Johnson-nomogram
R script to produce a Barber-Johnson nomogram

After Barber, Johnson 1973:

> Barber B. and Johnson D., "The Presentation of Acute Hospital In-patient Statistics",
> Hospital and Health Services Review, 1973

The R script produces a scatterplot and a dataframe with main statistics from a dataframe.

The input dataframe must include:

* unit (name of unit under analysi; may be a name, a month, etc.) 
* startdate (ISO format yyyy-mm-dd)
* enddate (ISO format yyyy-mm-dd)
* patientsdays (sum of ) 
* beds (beds available for the unit)
* discharges (number of discharges observed)
* workdays (workdays per week for the specific unit: eg. 5, 6, 7)

the output dataframe will include:

* unit
* startdate
* enddate
* patientsday
* beds
* discharges
* workdays

Use the functions as follows:

    h_stats(example_data)
    h_stats(example_data, plot = "none") #if you need just the statistics with no plot
