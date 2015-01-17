library(shiny)
load("AcquistionMethod.Rda")
load("PV.Module.Man.Rda")
load("Inverter.Man.Rda")
load("PV.Select.Rda")
load("IV.Select.Rda")

# Define UI for application that draws a histogram
shinyUI(navbarPage("NYS-Sun Initiative:  Installation Cost Barometer",
        tabPanel("Application",
        
        # Application title
        
        titlePanel(""),
        
        # Sidebar with Solar PV variables
        
        sidebarLayout(
                
                sidebarPanel(                
                        
                selectInput("CType",
                        "Type of Customer:", 
                        c("Residential", "Commercial", "Non-Profit"),
                        selected = "Residential"),
                                        
                selectInput("AcqMethod",
                        "Acquistion Method:",
                        Acquistion.Method,
                        selected = "Lease"),

                selectInput("InvMan",
                        "Inverter Manufacturer:",
                        Inverter.Man,
                        selected = IV.Select),
                
                selectInput("PVMan",
                        "PV Module Manufacturer:",
                        PV.Module.Man,
                        selected = PV.Select),

                sliderInput("Size",
                            "System Size (KW):",
                            min = 1,
                            max = 20,
                            value = 7.50)
                                                                  
                ), # Sidebar Panel Close

                mainPanel(
                        h4("Cost Distribution: 2013/2014 NY-Sun PV Installations"),
                        plotOutput("distPlot"),
                        h4("Solar PV System Cost Estimate: "),
                        verbatimTextOutput("Estimate"),
                        h5("This analysis was developed based on data retrived 
                        from the NY-Sun Initiative project database. The database 
                        provides a comprehensive listing of Solar PV projects 
                        installed under the New York State Energy Research and 
                        Development Authority (NYSERDA) Residential/Small Commercial
                        Solar Electric program. As of the date of this analysis, 
                        The database contained information on installation from
                        from 2003-2014  A parallel random forest prediction model 
                        was used to estimate the installation cost. The model 
                        was trained on a subset of the dataset which was limited
                        to projects installed from 2013 to 2014. Note that not 
                        all 2014 projects have been included in the database as 
                        of the date of this analysis as the datase did not contain
                        December 2015 projects as of the date of this analysis. 
                        The out of sample root mean square error associated with
                        the estimate is $4,795 with an Rsquared of 0.89" )

                ) # Main Panel Close
        ) # sidebar layout Clsoe           
 
        ), # tabPanel Close
                         
        tabPanel("User Guide <- click for user instructions",
                 
                 # Documentation title
                
                 titlePanel(""),
                  
                 h5("In order to use the project cost estimator, please make a 
                    selection from the following fields. The cost estimae will be
                    updated dynamically based on your input. The default settings
                    are based on the most frequently installed configuration and the 
                    mean installed capacity.: "),
                 
                 h5("Type of Installation: The sectors in this data set are 
                    Residential, Commercial, Industrial, Government and Nonprofit"),
                
                 h5("Acquisition Method: Solar photovoltaic project purchase agreement
                    type. Lease, Purchase, Power Purchase Agreement, or Unknown."),
                 
                 h5("Inverter manufacturer: Name of inverter manufacturer for 
                    project"),
                 
                 h5("PV Module Manufacturer: Name of photovoltaic (PV) module 
                    manufacturer for project"),
                 
                 h5("Size: The sum of kilowatt (KW) capacity ratings of the 
                    installed photovoltaic equipment.")

                 
                 
                 
        ) #tabPanel Close
        ) #navbarPage lose
        ) #ShinyUI Close
