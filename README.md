# Barber-Johnson-nomogram
R script to produce a Barber-Johnson nomogram

After Barber, Johnson 1973:

> Barber B. and Johnson D., "The Presentation of Acute Hospital In-patient Statistics",
> Hospital and Health Services Review, 1973

The R script produces a scatterplot and a dataframe with main statistics from an input dataframe.

The input dataframe must include:
* unit (name of unit under analysis; may be a name, a month, etc.) 
* startdate (ISO format yyyy-mm-dd)
* enddate (ISO format yyyy-mm-dd)
* patientsdays (sum of ) 
* beds (beds available for the unit)
* discharges (number of discharges observed)
* workdays (workdays per week for the specific unit: eg. 5, 6, 7)

**Note**: you can name columns as you prefer.

The output dataframe will include:
* unit (name of unit under analysis)
* tot_days (total days)
* act_days (actual working days in the period)
* LOS (average length of stay)
* PRE (average presence per day)
* RI (rotation index)
* BOR (bed occupancy rate)
* TI (turnover index)

An example input dataset and a sample plot are also included.
Use the functions as follows:

    h_stats(example_data)
    h_stats(example_data, plot = "none") #if you just need the statistics with no plot

For any comments, suggestions or corrections pleas drop me a line:
matteofiorani [at] gmail.com
