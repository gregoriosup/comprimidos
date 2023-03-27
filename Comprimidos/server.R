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
  
    saida_pm <- paste0("Resultado: ", format(resultados_pm$media_pm, nsmall = 4), " ± ", 
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
    
    df_valores_pm1 <- data.frame(x = c(1:20),valores_pm1)
    
    # criar grafico de linha
    
    grafico_linha_pm <- ggplot(df_valores_pm1, aes(x = x)) +
      geom_line(aes(y=valores_pm1))+
      geom_point(aes(y=valores_pm1))+
      labs(x = "Comprimidos", y= "Peso")+
      theme_classic()+
      scale_x_continuous(breaks = 1:20)+
      theme(
        axis.text = element_text(size = 15),
        axis.title = element_text(size = 20, color = "#387295")
      )
    
    output$grafline_pm <- renderPlot(grafico_linha_pm)
    
  })
    
    
  
}
