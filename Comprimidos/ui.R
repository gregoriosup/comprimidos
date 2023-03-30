library(shiny)
library(shinythemes)



# Define UI for application that draws a histogram
fluidPage(theme = shinytheme("cerulean"),
          
          tags$head(
            tags$link(rel = "stylesheet", type = "text/css", href = "custom.css")
          ),
          
          navbarPage("Caracterização de Comprimidos",
                     
                     tabPanel("Instruções",
#### instruções gerais ####                              
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
#### peso medio####                     
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
                                
                                h3(
                                  textOutput("resultados_pm")),
                                        
                                
                                plotOutput("grafline_pm", height = 500))
                     ),
#### espessura e diâmetro####                     
                     tabPanel("Espessura e Diâmetro",
                              
                              sidebarPanel(
                                tags$h3("Espessura (mm)"),
                                fluidRow(
                                  column(3, textInput("esp1", "1", "")),
                                  column(3, textInput("esp2", "2", "")),
                                  column(3, textInput("esp3", "3", "")),
                                  column(3, textInput("esp4", "4", ""))
                                ),
                                
                                fluidRow(
                                  column(3, textInput("esp5", "5", "")),
                                  column(3, textInput("esp6", "6", "")),
                                  column(3, textInput("esp7", "7", "")),
                                  column(3, textInput("esp8", "8", ""))
                                ),
                                fluidRow(
                                  column(3, textInput("esp9", "9", "")),
                                  column(3, textInput("esp10", "10", "")),
                                  column(3, textInput("esp11", "11", "")),
                                  column(3, textInput("esp12", "12", ""))
                                ),
                                fluidRow(
                                  column(3, textInput("esp13", "13", "")),
                                  column(3, textInput("esp14", "14", "")),
                                  column(3, textInput("esp15", "15", "")),
                                  column(3, textInput("esp16", "16", ""))
                                ),
                                fluidRow(
                                  column(3, textInput("esp17", "17", "")),
                                  column(3, textInput("esp18", "18", "")),
                                  column(3, textInput("esp19", "19", "")),
                                  column(3, textInput("esp20", "20", ""))
                                ),
                                
                                actionButton("calcular esp", "Calcular"),
                                
                                actionButton("plot_esp", "Gerar Gráfico"), 
                                
                                tags$h3("Diâmetro (mm)"),
                                fluidRow(
                                  column(3, textInput("diam1", "1", "")),
                                  column(3, textInput("diam2", "2", "")),
                                  column(3, textInput("diam3", "3", "")),
                                  column(3, textInput("diam4", "4", "")),
                                ),
                                fluidRow(
                                  column(3, textInput("diam5", "5", "")),
                                  column(3, textInput("diam6", "6", "")),
                                  column(3, textInput("diam7", "7", "")),
                                  column(3, textInput("diam8", "8", ""))
                                ),
                                fluidRow(
                                  column(3, textInput("diam9", "9", "")),
                                  column(3, textInput("diam10", "10", "")),
                                  column(3, textInput("diam11", "11", "")),
                                  column(3, textInput("diam12", "12", ""))
                                ),
                                fluidRow(
                                  column(3, textInput("diam13", "13", "")),
                                  column(3, textInput("diam14", "14", "")),
                                  column(3, textInput("diam15", "15", "")),
                                  column(3, textInput("diam16", "16", ""))
                                ),
                                fluidRow(
                                  column(3, textInput("diam17", "17", "")),
                                  column(3, textInput("diam18", "18", "")),
                                  column(3, textInput("diam19", "19", "")),
                                  column(3, textInput("diam20", "20", ""))
                                ),
                                
                                actionButton("calular_diam", "Calular"),
                                
                                actionButton("plot_diam", "Gerar Gráfico")
                                
                              ), #sidebar
                              
                              mainPanel(
                                
                                tags$h3(
                                  textOutput("resultado_esp")
                                ),
                                
                                tags$h3(
                                  textOutput("resultado_diam")
                                ),
                                
                                plotOutput("plot_diam"),
                                
                                plotOutput("plot_esp")
                                
                              )
                              
                              ), #tabpanel
#### dureza####                     
                     tabPanel("Dureza",
                              
                              sidebarPanel(
                                
                                tags$h3(
                                  "Dureza (N)"
                                ),
                                
                                fluidRow(
                                  column(6, textInput("dur1", "1", "")),
                                  column(6, textInput("dur2", "2", ""))
                                  ),
                                fluidRow(
                                  column(6, textInput("dur3", "3", "")),
                                  column(6, textInput("dur4", "4", ""))
                                ),
                                fluidRow(
                                  column(6, textInput("dur5", "5", "")),
                                  column(6, textInput("dur6", "6", ""))
                                ),
                                fluidRow(
                                  column(6, textInput("dur7", "7", "")),
                                  column(6, textInput("dur8", "8", ""))
                                ),
                                fluidRow(
                                  column(6, textInput("dur9", "9", "")),
                                  column(6, textInput("dur10", "10", ""))
                                ),
                                
                                actionButton("calcular_dur", "Calcular"),
                                
                                actionButton("plot_dur","Gerar Gráficos")
                                
                              ) #sidebarpanel
                              
                              ), #tab panel dureza
#### firabilidade####                     
                     tabPanel("Friabilidade"),
#### desintegração####                     
                     tabPanel("Desintegração"),
#### resultados gerais####                     
                     tabPanel("Resultados Gerais"),
                     
                     #absolutePanel("Desenvolvido por Guilherme Henrique Gregório
                      #             github.com/gregoriosup", bottom = 0, fixed = T, right = 10 )
                     
          ) #navbarpage
          
          
          
          
)#fluidpage
