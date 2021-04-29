# Ler arquivos Siscori em xlsx#

#carregar pacotes necessários
library(openxlsx)
library(dplyr)
library(stringr)


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

#padroniza a digitação para minúscula
base1$DESCRICAO.DO.PRODUTO<-tolower(base1$DESCRICAO.DO.PRODUTO)

#seleciona as descrições pertinentes à bicicleta elétrica
base2 <- filter(base1, str_detect(DESCRICAO.DO.PRODUTO,"bicicleta|e-bike|bike elétrica|bike eletrica|eletric bike|pedal assistido|pedal|bici"))

#estatística por ano_mês
base2$ANOMES<- as.character(base2$ANOMES)
bike_eletrica<-base2 %>%
  group_by (ANOMES)%>%
  summarise(n = sum(QTD.COMERCIAL.))

#salva os arquivos finais atualizados no diretório de trabalho
write.xlsx(base2, "base_atualizada.xlsx")
write.xlsx(bike_eletrica, "resumo_atualizado.xlsx")


