library(shiny)
library(shinythemes)

# Define UI for application that draws a histogram
fluidPage(theme = shinytheme("cerulean"),
          
          navbarPage("Caracterização de Comprimidos",
                     
                     tabPanel("Peso Médio",
                              sidebarPanel(
                                tags$h3("Peso Médio"),
                                fluidRow(
                                  column(3, textInput("pm1", "1", "")), 
                                  column(3, textInput("pm2", "2", "")), 
                                  column(3, textInput("pm3", "3", "")), 
                                  column(3, textInput("pm4", "4", ""))
                                ),
                                fluidRow(
                                  column(3, textInput("pm5", "5", "")), 
                                  column(3, textInput("pm6", "6", "")),
                                  column(3, textInput("pm7", "7", "")), 
                                  column(3, textInput("pm8", "8", ""))
                                ),
                                fluidRow(
                                  column(3, textInput("pm9", "9", "")),
                                  column(3, textInput("pm10", "10", "")), 
                                  column(3, textInput("pm11", "11", "")), 
                                  column(3, textInput("pm12", "12", ""))
                                ),
                                fluidRow(
                                  column(3, textInput("pm13", "13", "")), 
                                  column(3, textInput("pm14", "14", "")), 
                                  column(3, textInput("pm15", "15", "")),
                                  column(3, textInput("pm16", "16", ""))
                                ),
                                fluidRow(
                                  column(3, textInput("pm17", "17", "")), 
                                  column(3, textInput("pm18", "18", "")),
                                  column(3, textInput("pm19", "19", "")), 
                                  column(3, textInput("pm20", "20", ""))
                                ),
                                
                                actionButton("calcularpm", "Calcular"),
                                
                                actionButton("graficos_pm", "Gerar Gráficos")
                                
                              ),
                              
                              mainPanel(
                                
                                tags$div(
                                  textOutput("resultados_pm"),
                                  style = "font-size: 18px; color: #387295;"),
                                        
                                
                                plotOutput("grafline_pm", height = 500))
                     ),
                     
                     tabPanel("Espessura e Diâmetro"),
                     
                     tabPanel("Dureza"),
                     
                     tabPanel("Friabilidade"),
                     
                     tabPanel("Desintegração"),
                     
                     tabPanel("Resultados Gerais")
                     
          )
          
)
