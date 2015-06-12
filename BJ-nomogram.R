# Barber-Johnson nomogram
# Matteo Fiorani 2015
#
# See:
# Barber B. and Johnson D., "The Presentation of Acute Hospital 
# In-patient Statistics", Hospital and Health Services Review, 1973

h_stats <- function (dataframe, plot = 'barber') {
        thedata <- dataframe
        
        # ELAPSED DAYS
        tot_days <- as.numeric((as.Date(thedata[,3]) - as.Date(thedata[,2])), units="days") + 1
        # ACTUAL WORKING DAYS
        weeks <- round(as.numeric((as.Date(thedata[,3]) - as.Date(thedata[,2])), units="weeks"), digits = 0)        
        act_days <- (tot_days - ((7 - thedata[,7]) * weeks))
        
        # AVERAGE LOS (LENGHT OF STAY)
        LOS <- (thedata[,4] / thedata[,6])
        # AVERAGE DAILY PRESENCE
        PRE <- (thedata[,4] / act_days)
        # BED OCCUPANCY RATE
        BOR <- thedata[,4] / (thedata[,5] * act_days) * 100
        # ROTATION INDEX
        RI <- (thedata[,6] / thedata[,5])
        # TURNOVER INDEX
        TI <- ((act_days * thedata[,5] - thedata[,4]) / thedata[,6])
        
        unit <- thedata[,1]
        results <- data.frame(
                unit,
                tot_days,
                act_days,
                LOS,
                PRE,
                RI,
                BOR,
                TI
        )
        if(plot == 'barber'){
                plot_stats(results)
        }
        return(results)
}

plot_stats <- function (results){
        library(ggplot2)
        idati <- results
                acceptance_area <- data.frame(
                        id = rep(1, each = 4),
                        x = c(1, 1, 3, 3),
                        y = c(25, 3, 9, 25)
                )
                
                p0 <- ggplot(idati, aes(x = idati[,8], y = idati[,4])) +
                        xlab("turnover index") +
                        ylab("average length of stay") +
                        ggtitle("Barber-Johnson nomogram") +
                        theme(plot.title = element_text(lineheight=0.8, face="bold")) +
                        scale_x_continuous(breaks=seq(-1, 7, 1)) +  
                        geom_abline(intercept = 0, slope = 9, colour = "gray60") + 
                        geom_abline(intercept = 0, slope = 5.6, colour = "gray60") +
                        geom_abline(intercept = 0, slope = 4, colour = "gray60") +
                        geom_abline(intercept = 0, slope = 3, colour = "gray60") +
                        geom_abline(intercept = 0, slope = 2.3, colour = "gray60") +
                        geom_abline(intercept = 0, slope = 1.5, colour = "gray60") +
                        geom_abline(intercept = 0, slope = 1, colour = "gray60") +
                        geom_abline(intercept = 14.6, slope = -1, colour = "gray70") + 
                        geom_abline(intercept = 12.17, slope = -1, colour = "gray70") + 
                        geom_abline(intercept = 9.125, slope = -1, colour = "gray70") + 
                        geom_abline(intercept = 7.3, slope = -1, colour = "gray70") +
                        geom_polygon(data=acceptance_area, mapping=aes(x=x, y=y), fill = "darkgreen", alpha = 0.1) +
                        geom_point(aes(colour = unit), size = 4) +
                        annotate("text", x = c(0.3, 0.3, 0.3, 0.3),
                                 y = c(15.2, 12.67, 9.725, 7.9),
                                 label = c("RI 25", "RI 30", "RI 40", "RI 50"),
                                 colour = "gray70", size = 4) +
                        annotate("text", x = c(2.3, 4, 5.6, 5.6, 5.6, 5.6, 5.6),
                                 y = c(25.1,25.1,25.1, 18.7, 14.5, 9.7, 6.7),
                                 label = c("BOR 90%", "BOR 85%", "BOR 80%", "BOR 75%", "BOR 70%", "BOR 60%", "BOR 50%"),
                                 colour = "gray60", size = 4)
        return (plot(p0))
}
