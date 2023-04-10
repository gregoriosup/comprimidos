library(shiny)
library(shinythemes)
library(ggplot2)

# Define server logic 
function(input, output, session) {

  
####PESO MEDIO####
      
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
  
    saida_pm <- paste0("Peso médio: ", sprintf("%.4f", round(resultados_pm$media_pm, 4)), " ± ", 
                       sprintf("%.4f", round(resultados_pm$sd_pm, 4)), " g")
    
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
    
####DIAMETRO E ESPESSURA####
  
  calcular_media_sd_diam <- function(valores_diam) {
  
    media_diam <- mean(valores_diam)
    sd_diam <- sd(valores_diam)
    return(list(media_diam=media_diam, sd_diam=sd_diam))
}

  calcular_media_sd_esp <- function(valores_esp) {
    
    media_esp <- mean(valores_esp)
    sd_esp <- sd(valores_esp)
    return(list(media_esp=media_esp, sd_esp=sd_esp))
  }
  
  # evento de clique do botao peso medio
  observeEvent(input$calcular_diam, {
    
    #cria um vetor com os valores de input
    
    valores_diam <- numeric(20) # cria um vetor vazio com 20 posições
    for(i in 1:20){
      valores_diam[i] <- as.numeric(input[[paste0("diam", i)]]) #loop para preencher os 20 inputs mais rapido
    }
    
    #calcula a media e desvio padrao
    
    resultados_diam <- calcular_media_sd_diam(valores_diam)
    
    # formata a saida com 4 casas decimais
    
    saida_diam <- paste0("Diâmetro médio: ", sprintf("%.2f",round(resultados_diam$media_diam, 2)), " ± ", 
                       sprintf("%.2f", round(resultados_diam$sd_diam, 2)), " mm")
    
    # mostra os resultados no output
    
    output$resultados_diam <- renderText(saida_diam)
    
  })
   
  
  # evento de clique do botao peso medio
  observeEvent(input$calcular_esp, {
    
    #cria um vetor com os valores de input
    
    valores_esp <- numeric(20) # cria um vetor vazio com 20 posições
    for(i in 1:20){
      valores_esp[i] <- as.numeric(input[[paste0("esp", i)]]) #loop para preencher os 20 inputs mais rapido
    }
    
    #calcula a media e desvio padrao
    
    resultados_esp <- calcular_media_sd_esp(valores_esp)
    
    # formata a saida com 4 casas decimais
    
    saida_esp <- paste0("Espessura média: ", sprintf("%.2f",round(resultados_esp$media_esp, 2)), " ± ", 
                         sprintf("%.2f",round(resultados_esp$sd_esp, 2)), " mm")
    
    # mostra os resultados no output
    
    output$resultados_esp <- renderText(saida_esp)
    
  })
  
  # evento do botão gerar graficos
  
  observeEvent(input$plot_diam, {
    
    # criaçao de objeto com os valores inputados
    valores_diam1 <- numeric(20) # cria um vetor vazio com 20 posições
    for(i in 1:20){
      valores_diam1[i] <- as.numeric(input[[paste0("diam", i)]]) #loop para preencher os 20 inputs mais rapido
    }
  
    
    df_diam <- data.frame(x=c(1:20), valores_diam1)
    
    grafico_diam <- ggplot(data = df_diam, aes(x="", y= valores_diam1))+
      geom_boxplot(width = 0.2)+
      geom_violin(fill = "#387295", alpha = 0.2)+
      theme_classic()+
      labs(x= "", y= "Milímetros")+
      ggtitle("Variação de diâmetro (mm)")+
      theme(
        title = element_text(size = 20, color = "#387295")
      )+
      geom_dotplot(binaxis = "y",
                   stackdir = "center",
                   dotsize = 0.5,
                   alpha=0.3)
    
    output$plot_diam1 <- renderPlot(grafico_diam)
  })

  # evento do botão gerar graficos
  
  observeEvent(input$plot_esp, {
    
    # criaçao de objeto com os valores inputados
    valores_esp1 <- numeric(20) # cria um vetor vazio com 20 posições
    for(i in 1:20){
      valores_esp1[i] <- as.numeric(input[[paste0("esp", i)]]) #loop para preencher os 20 inputs mais rapido
    }
    
    
    df_esp <- data.frame(x=c(1:20), valores_esp1)
    
    grafico_esp <- ggplot(data = df_esp, aes(x="", y= valores_esp1))+
      geom_boxplot(width = 0.2)+
      geom_violin(fill = "#387295", alpha = 0.2)+
      theme_classic()+
      labs(x= "", y= "Milímetros")+
      ggtitle("Variação de espessura (mm)")+
      theme(
        title = element_text(size = 20, color = "#387295")
      )+
      geom_dotplot(binaxis = "y",
                   stackdir = "center",
                   dotsize = 0.5,
                   alpha = 0.3)
    
    output$plot_esp1 <- renderPlot(grafico_esp)
  
    })
  
  }
