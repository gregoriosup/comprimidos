library(shiny)
library(shinythemes)

# Define UI for application that draws a histogram
fluidPage(theme = shinytheme("cerulean"),
          
          navbarPage("Caracterização de Comprimidos",
                     
                     tabPanel("Peso Médio",
                              sidebarPanel(
                                tags$h3("Peso Médio"),
                                fluidRow(
                                  column(3, textInput("pm1", "1", "123")), 
                                  column(3, textInput("pm2", "2", "123")), 
                                  column(3, textInput("pm3", "3", "123")), 
                                  column(3, textInput("pm4", "4", "123"))
                                ),
                                fluidRow(
                                  column(3, textInput("pm5", "5", "123")), 
                                  column(3, textInput("pm6", "6", "123")),
                                  column(3, textInput("pm7", "7", "123")), 
                                  column(3, textInput("pm8", "8", "123"))
                                ),
                                fluidRow(
                                  column(3, textInput("pm9", "9", "123")),
                                  column(3, textInput("pm10", "10", "123")), 
                                  column(3, textInput("pm11", "11", "123")), 
                                  column(3, textInput("pm12", "12", "123"))
                                ),
                                fluidRow(
                                  column(3, textInput("pm13", "13", "123")), 
                                  column(3, textInput("pm14", "14", "123")), 
                                  column(3, textInput("pm15", "15", "123")),
                                  column(3, textInput("pm16", "16", "123"))
                                ),
                                fluidRow(
                                  column(3, textInput("pm17", "17", "123")), 
                                  column(3, textInput("pm18", "18", "123")),
                                  column(3, textInput("pm19", "19", "123")), 
                                  column(3, textInput("pm20", "20", "123"))
                                ),
                                
                                actionButton("calcularpm", "Calcular"),
                                
                                actionButton("graficos_pm", "Gerar Gráficos")
                                
                              ),
                              
                              mainPanel(textOutput("resultados_pm"),
                                        plotOutput("grafline_pm")),
                              
                          
                     ),
                     
                     tabPanel("Espessura e Diâmetro"),
                     
                     tabPanel("Dureza"),
                     
                     tabPanel("Friabilidade"),
                     
                     tabPanel("Desintegração"),
                     
                     tabPanel("Resultados Gerais")
                     
          )
          
)
