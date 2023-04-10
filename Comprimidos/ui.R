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
                                        br(),
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
                                        br(),
                                        
                                        h4("Boa caracterização!")
                                        
                                        )),
#### peso medio####                     
                     tabPanel("Peso Médio",
                              sidebarPanel(
                                tags$h3("Peso Médio (g)"),
                                fluidRow(
                                  column(3, textInput("pm1", "1", "0.1100")), 
                                  column(3, textInput("pm2", "2", "0.1110")), 
                                  column(3, textInput("pm3", "3", "0.1104")), 
                                  column(3, textInput("pm4", "4", "0.1111"))
                                ),
                                fluidRow(
                                  column(3, textInput("pm5", "5", "0.1116")), 
                                  column(3, textInput("pm6", "6", "0.1111")),
                                  column(3, textInput("pm7", "7", "0.1110")), 
                                  column(3, textInput("pm8", "8", "0.1110"))
                                ),
                                fluidRow(
                                  column(3, textInput("pm9", "9", "0.1109")),
                                  column(3, textInput("pm10", "10", "0.1105")), 
                                  column(3, textInput("pm11", "11", "0.1110")), 
                                  column(3, textInput("pm12", "12", "0.1112"))
                                ),
                                fluidRow(
                                  column(3, textInput("pm13", "13", "0.1117")), 
                                  column(3, textInput("pm14", "14", "0.1114")), 
                                  column(3, textInput("pm15", "15", "0.1115")),
                                  column(3, textInput("pm16", "16", "0.1114"))
                                ),
                                fluidRow(
                                  column(3, textInput("pm17", "17", "0.1107")), 
                                  column(3, textInput("pm18", "18", "0.1108")),
                                  column(3, textInput("pm19", "19", "0.1110")), 
                                  column(3, textInput("pm20", "20", "0.1106"))
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
                                  column(3, textInput("esp1", "1", "3.28")),
                                  column(3, textInput("esp2", "2", "3.34")),
                                  column(3, textInput("esp3", "3", "3.32")),
                                  column(3, textInput("esp4", "4", "3.29"))
                                ),
                                
                                fluidRow(
                                  column(3, textInput("esp5", "5", "3.28")),
                                  column(3, textInput("esp6", "6", "3.30")),
                                  column(3, textInput("esp7", "7", "3.27")),
                                  column(3, textInput("esp8", "8", "3.27"))
                                ),
                                fluidRow(
                                  column(3, textInput("esp9", "9", "3.27")),
                                  column(3, textInput("esp10", "10", "3.29")),
                                  column(3, textInput("esp11", "11", "3.33")),
                                  column(3, textInput("esp12", "12", "3.32"))
                                ),
                                fluidRow(
                                  column(3, textInput("esp13", "13", "3.27")),
                                  column(3, textInput("esp14", "14", "3.30")),
                                  column(3, textInput("esp15", "15", "3.31")),
                                  column(3, textInput("esp16", "16", "3.27"))
                                ),
                                fluidRow(
                                  column(3, textInput("esp17", "17", "3.25")),
                                  column(3, textInput("esp18", "18", "3.30")),
                                  column(3, textInput("esp19", "19", "3.28")),
                                  column(3, textInput("esp20", "20", "3.29"))
                                ),
                                
                                actionButton("calcular_esp", "Calcular"),
                                
                                actionButton("plot_esp", "Gerar Gráfico"), 
                                
                                tags$h3("Diâmetro (mm)"),
                                fluidRow(
                                  column(3, textInput("diam1", "1", "6.49")),
                                  column(3, textInput("diam2", "2", "6.49")),
                                  column(3, textInput("diam3", "3", "6.50")),
                                  column(3, textInput("diam4", "4", "6.49")),
                                ),
                                fluidRow(
                                  column(3, textInput("diam5", "5", "6.49")),
                                  column(3, textInput("diam6", "6", "6.49")),
                                  column(3, textInput("diam7", "7", "6.50")),
                                  column(3, textInput("diam8", "8", "6.49"))
                                ),
                                fluidRow(
                                  column(3, textInput("diam9", "9", "6.49")),
                                  column(3, textInput("diam10", "10", "6.50")),
                                  column(3, textInput("diam11", "11", "6.49")),
                                  column(3, textInput("diam12", "12", "6.50"))
                                ),
                                fluidRow(
                                  column(3, textInput("diam13", "13", "6.49")),
                                  column(3, textInput("diam14", "14", "6.49")),
                                  column(3, textInput("diam15", "15", "6.50")),
                                  column(3, textInput("diam16", "16", "6.50"))
                                ),
                                fluidRow(
                                  column(3, textInput("diam17", "17", "6.49")),
                                  column(3, textInput("diam18", "18", "6.50")),
                                  column(3, textInput("diam19", "19", "6.48")),
                                  column(3, textInput("diam20", "20", "6.50"))
                                ),
                                
                                actionButton("calcular_diam", "Calcular"),
                                
                                actionButton("plot_diam", "Gerar Gráfico")
                                
                              ), #sidebar
                              
                              mainPanel(
                                
                                tags$h3(
                                  textOutput("resultados_esp")
                                ),
                                
                                br(),
                                
                                plotOutput("plot_esp1", width = 400),
                                
                                br(),
                                
                                tags$h3(
                                  textOutput("resultados_diam")
                                ),
                                
                                br(),
                                
                                plotOutput("plot_diam1", width = 400)
                                
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
