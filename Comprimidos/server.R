library(shiny)
library(shinythemes)
library(ggplot2)

# Define server logic required to draw a histogram
function(input, output, session) {
  
  # função para calcular a media e desvio padrao
  calcular_media_sd_pm <- function(valores_pm) {
    
    media_pm <- mean(valores_pm)
    sd_pm <- sd(valores_pm)
    return(list(media_pm=media_pm, sd_pm=sd_pm)) # list cria uma lista com os elementos media_pm e sd_pm
    
  }
  
  # evento de clique do botao peso medio
  observeEvent(input$calcularpm, {
    
    #cria um vetor com os valores de input
    
    valores_pm <- numeric(20) # cria um vetor vazio com 20 posições
    for(i in 1:20){
      valores_pm[i] <- as.numeric(input[[paste0("pm", i)]]) #loop para preencher os 20 inputs mais rapido
    }
    
    #calcula a media e desvio padrao
  
    resultados_pm <- calcular_media_sd_pm(valores_pm)
    
    # formata a saida com 4 casas decimais
  
    saida_pm <- paste0("Resultado: ", round(resultados_pm$media_pm, 4), " ± ", 
                       round(resultados_pm$sd_pm, 4), " g")
    
    # mostra os resultados no output
  
    output$resultados_pm <- renderText(saida_pm)
    
  })
 
   # evento do botão gerar graficos
  
  observeEvent(input$graficos_pm, {
    
    # criaçao de objeto com os valores inputados
    valores_pm1 <- numeric(20) # cria um vetor vazio com 20 posições
    for(i in 1:20){
      valores_pm1[i] <- as.numeric(input[[paste0("pm", i)]]) #loop para preencher os 20 inputs mais rapido
    }
    
    media_pm <- mean(valores_pm1)
    
    limite_inf <- ifelse(media_pm <= 0.080, media_pm *0.9,
                         ifelse(media_pm > 0.080 & media_pm < 0.250, media_pm*0.925, media_pm*0.95))
    
    limite_sup <- ifelse(media_pm <= 0.080, media_pm *1.10,
                         ifelse(media_pm > 0.080 & media_pm < 0.250, media_pm*1.075, media_pm*1.05))
    
    limite_inf2 <- ifelse(media_pm <= 0.080, media_pm * 0.8,
                          ifelse(media_pm > 0.080 & media_pm < 0.250, media_pm*0.85, media_pm*0.90))
    
    limite_sup2 <- ifelse(media_pm <= 0.080, media_pm *1.20,
                          ifelse(media_pm > 0.080 & media_pm < 0.250, media_pm*1.15, media_pm*1.10))
    
    
    df_valores_pm1 <- data.frame(x = c(1:20),valores_pm1,
                                 
                                 grupo = ifelse(valores_pm1 < limite_inf & valores_pm1 >= limite_inf2, "Excede os limites de variação",
                                        ifelse(valores_pm1 > limite_sup & valores_pm1 <= limite_sup2, "Excede os limites de variação",
                                               ifelse(valores_pm1 < limite_inf2 | valores_pm1 > limite_sup2, "Excede o dobro dos limites de variação", "Dentro dos limites"))))
    
    # criar grafico de linha
    
    nota_de_rodapepm <- "Pode-se tolerar, no máximo, duas unidades fora dos limites, em relação ao peso médio, porém, nenhuma poderá estar acima ou abaixo do dobro das \nporcentagens indicadas. (Farmacopeia Brasileira, 6ª Edição)"
    
    
    grafico_linha_pm <- ggplot(df_valores_pm1, aes(x = x)) +
      geom_line(aes(y=valores_pm1))+
      geom_point(aes(y = valores_pm1, colour = grupo))+
      labs(x = "Comprimidos", y= "Peso", caption = nota_de_rodapepm)+
      scale_color_manual(values = c("Excede o dobro dos limites de variação" = "red", 
                                    "Excede os limites de variação" = "yellow", 
                                    "Dentro dos limites" = "green"))+
      theme_classic()+
      scale_x_continuous(breaks = 1:20)+
      ggtitle("Variação de peso dos comprimidos e classificação segundo a Farmacopeia Brasileira")+
      theme(
        axis.text = element_text(size = 15),
        axis.title = element_text(size = 20, color = "#387295"),
        legend.title = element_blank(),
        legend.text = element_text(size = 15),
        legend.position = "bottom",
        title = element_text(size = 15, colour = "#387295"),
        plot.title = element_text(vjust = 4),
        plot.margin = unit(c(3, 1, 1, 1), "lines"),
        axis.title.x = element_text(vjust = -2),
        axis.title.y = element_text(vjust = 2),
        legend.margin = margin(t=20),
        plot.caption = element_text(colour = "black", vjust = -2)
      )
    
    
    output$grafline_pm <- renderPlot(grafico_linha_pm)
    

  })
    
    
  
}
