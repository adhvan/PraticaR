
#Carregando bibliotecas necessárias

library(graphics)
library(xlsx)
library(XML)
library(tseries)
library(ggplot2)
# abrindo o arquivo XML com os dados do ECG
arq1 <-xmlParse("c:/doutorado/Exame_2430.XML")
#Lendo o nó "Canais" e gerando uma estrutura em R com seis registros com 12 colunas, uma para cada derivação 
dd = xmlToDataFrame(getNodeSet(arq1, "//Canais"))
#Retirando o erro no primeiro registro e obtendo a derivaçao a primeira amostra da derivaçaõ 1, convertendo em Inteiro
myVector <- (strsplit(as.character(dd[1,1]), ";"))
myVector[[1]][1]<-"-4"
myVector <- as.numeric(unlist(myVector[[1]]))
#PLotando a série temporal
myVectorts <- ts(myVector)
plot.ts(myVectorts)

#Gravando os dados em um arquivo Excel

write.xlsx(dd, "c:/doutorado/ecg1.xlsx")
write.csv(dd[1,1],file="c:/doutorado/ECG1.csv",sep = ';')
