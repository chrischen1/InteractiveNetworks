#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
library(rgl)
library(shiny)
library(networkD3)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  titlePanel("Regulatory Network Analysis"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      h3("Network parameters"),
      passwordInput("password", h4("Data access code(will use test data by default)")),
      textInput("network_cutoff", h4("Network cutoff"), 
                value = 0.0035),
      textInput("distance_limit", h4("Distance limit"), 
                value = 3),
      textInput("target_gene", h4("Center gene of interest"), 
                value = "AT3G24050"),
      selectInput("network_method", h4("Network algorithm"), 
                  choices = list("ARACNe" = 'aracne', "CLR" = 'clr',
                                 "MINet" = 'minet','MRNet'='mrnet','GNET'='gnet'),selected = 1),
      
      actionButton("goButton", "Generate network")), 
    
    # Show a plot of the generated distribution
    mainPanel(
      h5(textOutput("msg")),
      tabsetPanel(id = "inTabset"
                  ,tabPanel(title = "TF_Gene", value = "panel1", forceNetworkOutput("plot_2d",width = 1024,height = 768))
                  ,tabPanel(title = "TF_TF", value = "panel0", forceNetworkOutput("plot_2d_tf",width = 1024,height = 768))
                  ,tabPanel(title = "Gene_network", value = "panel2", forceNetworkOutput("plot_2d_full",width = 1024,height = 768))
                  # ,tabPanel(title = "3D", value = "panel2", rglwidgetOutput("plot_3d",width = 1024,height = 768))
                  ,tabPanel(title = "Genes", value = "panel3", textOutput("genes"))
                  ,tabPanel(title = "Gene_freq", value = "panel4", tableOutput("gene_freq"))
      )
    )
  )
))
