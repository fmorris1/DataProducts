NYS-Sun Initiative: Installation Cost Barometer 
========================================================
author: Frederick Morris
date: January 2015
transition-speed: fast



Introduction
========================================================

- This application was developed based on data retrieved 
from the NY-Sun Initiative project database.  

- The database provides a comprehensive listing of Solar PV projects installed under the New York State Energy Research and Development Authority (NYSERDA) Residential/Small Commercial Solar Electric program.

- The application provides a means to estimate the cost of installing
a Solar PV system based on various configuration options, the choice of
financing method and the proposed customer type.


The NY-Sun Initiative Data
========================================================
***As of the date of this analysis, the database contained information on 12,499 installations from 2003-2014. Based on the observation that installed costs have been decreasing on a yearly basis, only installations from 2013 and 2014 were used to develop the prediction model.*** 




|  Year  |  Installations  |  Average Cost per Watt  |
|:------:|:---------------:|:-----------------------:|
|  2003  |       43        |          8.076          |
|  2004  |       98        |          8.044          |
|  2005  |       102       |          8.203          |
|  2006  |       210       |          8.797          |
|  2007  |       359       |          8.784          |
|  2008  |       431       |          8.706          |
|  2009  |       787       |          8.669          |
|  2010  |       971       |          7.436          |
|  2011  |      1,040      |          6.602          |
|  2012  |      2,177      |          5.542          |
|  2013  |      2,609      |          4.718          |
|  2014  |      3,672      |          4.482          |

Data Analysis and Machine Learning Model Selection
========================================================

***Observed extreme outliers were removed to improve the performance of the model and a Parallel computing Random Forest regresion model was selected to approximate the installed cost estimates***

![plot of chunk unnamed-chunk-2](NYbarometerApp-figure/unnamed-chunk-2.png) 

The NYS-Sun Initiative: Installation Cost Barometer  
========================================================

The following is a link to the application:
[http://clarion.shinyapps.io/PR_Project/](http://clarion.shinyapps.io/PR_Project/)

![plot of chunk chart](NYbarometerApp-figure/chart.png) 


