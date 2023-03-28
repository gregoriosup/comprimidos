library(shiny)
library(shinythemes)

# Define UI for application that draws a histogram
fluidPage(theme = shinytheme("cerulean"),
          
          navbarPage("Caracterização de Comprimidos",
                     
                     tabPanel("Instruções",
                              
                              mainPanel(h2("Instruções Gerais"),
                                        
                                        p("Aplicativo desenvolvido com o objetivo de compilar as análises
                                        mais relevantes para a caracterização física de um comprimido não-revestido. 
                                        "),
                                        
                                        p("O projeto de otimização da caracteriazação está em fase de desenvolvimento e manutenção.
                                          Portanto, sugiro que os resultados sejam revisados ao final das análises."),
                                        
                                        p("Os testes foram baseados na Farmacopeia Brasileira 6ª edição. É recomendado sua leitura 
                                          para melhor entendimento dos resultados."),
                                        
                                        p("Atentar-se às unidades de medidas necessárias para cada teste. Para peso médio, utilizar grama 
                                        (g). Espessura e diâmetro, milímetro (mm). Dureza, newton (N). Friabilidade, porcentagem (%). Desintegração, minutos."),
                                        
                                        p("Ao digitar os valores obtidos experimentalmente, usar ponto (.) como separador de decimais."),
                                        
                                        h4("Boa caracterização!")
                                        
                                        )),
                     
                     tabPanel("Peso Médio",
                              sidebarPanel(
                                tags$h3("Peso Médio (g)"),
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
