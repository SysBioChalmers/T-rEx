#
# This is a Shiny web application called T-rex. You can run the application by clicking
# the 'Run App' button above.
#
# Authors: David Bergenholm, Christoph Börlin, Petter Holland & Jens Nielsen
# Chalmers University of Technology
# Department of Biology and Bioengineering

library(rsconnect)




suppressMessages(library(shiny))
suppressMessages(library(ggplot2))
suppressMessages(library(RColorBrewer))
suppressMessages(library(dplyr))
suppressMessages(library(DT))
suppressMessages(library(gdata))
suppressMessages(library(gplots))
suppressMessages(library(gtools))
suppressMessages(library(scales))
suppressMessages(library(GGally))
suppressMessages(library(network))
suppressMessages(library(MASS))
suppressMessages(library(ggpubr))
suppressMessages(library(cluster))
suppressMessages(library(factoextra))
suppressMessages(library(biomaRt))
suppressMessages(library(shinyWidgets))
suppressMessages(library(Biostrings))
suppressMessages(library(IRanges))
suppressMessages(library(shinycssloaders))
suppressMessages(library(sna))
suppressMessages(library(shinyFiles))
suppressMessages(library(shinyjs))
suppressMessages(library(shinyBS))

# Define UI 
fluidPage(
  
  # Application title
  tabsetPanel(type="tabs",
              
              tabPanel("Welcome",
                       fluidRow(
                         column(width=12, align="center", 
                                h1(" "),
                                h3("Welcome to"),
                                h2("T-rEx"),
                                h1(" "),
                                h4(tags$em("S. cerevisiae")," Transcription factor Explorer"),
                                h6("David Bergenholm, Christoph Börlin, Petter Holland, & Jens Nielsen"),
                             
                                a("GitHub link", href="https://github.com/SysBioChalmers/T-rEx"),
                                imageOutput("sctrex",height=120) %>% withSpinner(color="#0dc5c1")
                                
                  
                         ))),
              tabPanel("Transcription Factor Summary",
                       sidebarLayout(
                         sidebarPanel(width=2,
                           fluidRow("Select Transcription Factor",
                                   column(width=6,
                                          uiOutput("TFselectSum"),
                                          uiOutput("CondselectSum")
                                          ),
                                    column(width=12,
                                    h4("Dowload Data"),
                                    h5("Peak list contains the sum of all peaks identified at a given promoter for each condition."),
                                    h5("Peak list advanced contains the gene, chromosome, strand, peak position, strength of binding and the condition"),
                                    downloadButton("downloadPeakData", "Download Peaklist"),
                                    downloadButton("downloadPeakDataAd", "Download Peaklist advanced"))
                                   
                                    
                           )),
                         mainPanel(
                           fluidRow( 
                                           h4("Targets"),
                                           h6(dataTableOutput("table1",height=200 ))),
                           fluidRow(
                                    column(width=3,
                                           h4("Consensus Motif"),
                                           uiOutput("plots.motif",height=200)),
                                    column(width=3,
                                           h4("Sequence map"),
                                           uiOutput("plots.seq",height=200)),
                                    column(width=3,
                                           h4("Peak Distribution Profile"), 
                                           uiOutput("plots.PeakDist",height=200)),
                                    column(width=3,
                                           h4("Read Distribution Profile"), 
                                           uiOutput("plots.ReadDist",width=50))
                                    )
                                  )
                       )
              ),
              tabPanel("Transcription Factor Binding Data",
                       fluidRow(
                         column(width=2,class="well",
                                uiOutput("text"),
                                verbatimTextOutput("GeneInfo"),
                                h4("Select Transcription Factor"),
                                uiOutput("TFselect"),
                                uiOutput("CondselectPeak"),
                                actionButton("Load", "Load Data"),
                                
                                column(width=12,
                                textInput("motifstr", label = h4("Motif"), value = ""),
                                h6("Include more motifs using + "),
                                actionButton("motiffinder","Search", value = F),
                                verbatimTextOutput("info"),
                                h4("Sequence relative to TSS"),
                                textInput("SeqMin", label = h5("From"), value = ""),
                                textInput("SeqMax", label=h5("To"),value = ""),
                                textOutput("Sequnce_out"),
                                actionButton("SeqFind","Search", value = F),
                                uiOutput("ReadsDown"),
                                h5("Download the displayed reads"),
                                downloadButton("downloadreadsData", "Download Reads"))
                                ),   
                         column(width=10, 
                                column(width=9, 
                                       h4("Transcription factor binding profile"),
                                       uiOutput("plots.peak")),
                                       column(width=1, 
                                       h4("Legend"),
                                       checkboxInput("TF_BS","TF BS", value = F),
                                       checkboxInput("TATA","TATA", value = F),
                                       checkboxInput("yranges","Fixed y-axis", value = F),
                                       plotOutput("plotBS",height = 800)
                                                )
                                )
                       )
              ),
              
              tabPanel("Transcription Factor Analysis",
                       sidebarLayout(
                         sidebarPanel(width=3,
                                      h3("Dataset"),
                                      selectInput("Datasetval","Dataset",c("Peaks","SNR"), selected="Peaks", selectize=TRUE),
                                      h5("This analysis is based on peak identification"),
                                      selectInput("test", "Test",c("Fisher","Heatmap","Network","Cluster","Linear Model","Shared Targets"), selected="Fisher", selectize=TRUE),
                                      
                                      
                                      conditionalPanel(
                                        condition = "input.test == 'Cluster'",
                                        sliderInput("slider1", label = h5("Number of cluster"), min = 1, 
                                                    max = 10, value = 5)),
                                      conditionalPanel(
                                        condition = "input.test == 'Shared Targets'",
                                        uiOutput("TFselectAn")),
                                      
                                      uiOutput("TestInput"),
                                      uiOutput("CondselectAn"),
                                      
                                      selectInput("val1", "Select Gene list",c("All Genes","Only Yeast8"), selected="All Genes", selectize=TRUE),
                                      textInput("goterm", "Select GO-term filtering", value="Amino acid"),
                                      h6("To include more GO-terms add + inbetween."),
                                      
                                      
                                      actionButton("search", "Search"),
                                      h4(" "),
                                      
                                      uiOutput("GOSharedTargets"),
                                      dataTableOutput("goterms"),
                                      uiOutput("StatDown"),
                                      downloadButton("downloadStatData", "Download")
                         ), 
                         
                         mainPanel(
                           fluidRow(
                             column(width = 10, 
                                    
                                           uiOutput("plots.analysis")
                                          ))
                         )
                       )),
              
              tabPanel("Include data set",
                       mainPanel(
                         h3("Includa a new dataset for analysis"),
                         textInput("New_TF","Name TF"),
                         fileInput('files', 'Please select all files to upload', multiple = TRUE),
                         actionButton('submit1', label = "Submit"),
                         h3("Data status"),
                         verbatimTextOutput("text3"),
                         verbatimTextOutput("text2")
                         )
                      )
        )
  )


