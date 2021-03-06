# Define UI for bacondecomp
ui <- fluidPage(
    tags$head(
        tags$style(
            HTML('body{font-size:11px;background-color:#FFFFFF} #RegSum1{font-size:9px}#RegSum2{font-size:9px}')
        )
    ),
    # Sidebar for settings
    column(3,
           # Settings
           br(" "),br(),br(),
           strong("Settings"),br(),br(),
           # Inputs
           numericInput(inputId= "seed",label="Set seed", 1909, min = 0, max = NA),
           h5("Treatment effects"),br(),br(),
           sliderInput(inputId = "group2treatmenteffect",label = "Treatment effect for group 2 (baseline):",min = 0,max = 3,value = 1.4,step=0.1),
           sliderInput(inputId = "group3treatmenteffect",label = "Treatment effect for group 3  (baseline):",min = 0,max = 3,value = 1.6,step=0.1),
           h5("Time-varying treatment effects"),br(),br(),
           sliderInput(inputId = "group2timeeffect",label = "Change in treatment effect over time for group 2 (growth rate):",min = -0.03,max = 0.03,value = 0.01,step=0.01),
           sliderInput(inputId = "group3timeeffect",label = "Change in treatment effect over time for group 3 (growth rate):",min = -0.03,max = 0.03,value = 0,step=0.01),
           h5("Treatment timing"),br(),br(),
           sliderInput(inputId = "group2treatment",label = "When does group 2 get treated?",min = 2,max = 28,value = 10),
           sliderInput(inputId = "group3treatment",label = "When does group 3 get treated?",min = 2,max = 28,value = 20),
           
    ),
    # Main panel with results
    column(6,
           h3("Illustration of 'Goodman-Bacon (2019): DD  with Variation in Treatment Timing' "),
           br(),"by Hans H. Sievertsen", tags$a(href="https://github.com/hhsievertsen/bacondecomp", "(source code)"),"(h.h.sievertsen@bristol.ac.uk)",br(),
           # chart
           plotOutput(outputId = "distPlot"),
           h4("The two-way fixed effects DD:"),uiOutput('DD'),
           h4("Goodman-Bacon decomposition:"),
           verbatimTextOutput(outputId = "RegSum1"),
           h4("ATTs:"),
           verbatimTextOutput(outputId = "RegSumATT"),
           h4("Regression output:"),
           verbatimTextOutput(outputId = "RegSum2"),
    ),
    # Side bar with info
    fluidRow(column(3,
                    # Explanation
                  br(),br(),
                  br(),br(),
                  strong("! Change settings in the panel on the left !"),br(), 
                  br(),
                    strong("Setup"),br(),
                    "- 3 equally sized groups",br(),
                    "- Group 1 is never treated",br(),
                    "- Groups 2 & 3 get treated at some point (see left panel).",br(),
                    "- Treatment effects can vary across groups and over time (see left panel).",br(),
                    "- The two-way fixed effects DD  is estimated with felm() from the lfe package, by estimating equation (2) from Goodman-Bacon (2019):",br(),
              
                    withMathJax(
                        helpText('$$y_{it}=\\alpha_{i\\cdot}+\\alpha_{\\cdot t}+\\beta^{DD}D_{it}+e_{it}$$')),br(),
                    "- the Bacon Decomposition is done using the bacomdecomp package",
                    br(),
                    br("Sources"),
                    "* ",  tags$a(href="https://cdn.vanderbilt.edu/vu-my/wp-content/uploads/sites/2318/2019/07/29170757/ddtiming_7_29_2019.pdf", "Goodman-Bacon (2019) Working Paper"),
                    br(),
                    "* ",tags$a(href="https://cran.r-project.org/web/packages/bacondecomp/readme/README.html", "bacondecomp for R"),
               
                   br(),br(),
                   strong("Updates:"),br(),
                   "- May 12, 2020: first version by Hans H. Sievertsen",br(),
                   "- May 13, 2020: incorporated changes by Matthieu Stigler (https://matthieustigler.github.io/)",br(),br(),
                   "Corrections and suggestions are very welcome (by e-mail: h.h.sievertsen@bristol.ac.uk or on github: https://github.com/hhsievertsen/bacondecomp)"
    )
   ))
