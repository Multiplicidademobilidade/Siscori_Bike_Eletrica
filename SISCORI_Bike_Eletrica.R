# Ler arquivos Siscori em xlsx#

#carregar pacotes necess�rios
library(openxlsx)
library(dplyr)
library(stringr)
library(tidyr)


#Escolher a pasta de trabalho
setwd("C:/SISCORI/")

#colocar novas planilhas na pasta 'juntar'
#ler arquivos da pasta 'juntar

files <- list.files(path = 'C:/SISCORI/juntar',
                    pattern = "\\.xlsx$", full.names = TRUE)

#leitura das bases
base1<-data.frame()
for (i in files) {
  arquivo<-read.xlsx(i)
  arquivo<- select (arquivo, "ANOMES", "COD.NCM","PAIS.DE.ORIGEM", "PAIS.DE.AQUISICAO","DESCRICAO.DO.PRODUTO","QTD.COMERCIAL.")
  ncm <-arquivo %>% filter (COD.NCM =='87116000' | COD.NCM =='87119000')
  base1<-rbind(base1, ncm)
}

#padroniza a digita��o para min�scula
base1$DESCRICAO.DO.PRODUTO<-tolower(base1$DESCRICAO.DO.PRODUTO)

#seleciona as descri��es pertinentes � bicicleta el�trica
base2 <- filter(base1, str_detect(DESCRICAO.DO.PRODUTO,"bicicleta|e-bike|bike el�trica|bike eletrica|eletric bike|pedal assistido|pedal|bici"))

#estat�stica por ano_m�s
base2$ANOMES<- as.character(base2$ANOMES)
base2$QTD.COMERCIAL.<-as.numeric(base2$QTD.COMERCIAL.)
base2<-base2 %>% mutate(QTD.COMERCIAL. = replace_na(QTD.COMERCIAL., 0))

bike_eletrica<-base2 %>%
  group_by (ANOMES)%>%
  summarise(n = sum(QTD.COMERCIAL.))

#salva os arquivos finais atualizados no diret�rio de trabalho
write.xlsx(base2, "base_atualizada.xlsx")
write.xlsx(bike_eletrica, "resumo_atualizado.xlsx")


