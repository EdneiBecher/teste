# carregando o readr
# carregando o arquivo mudas
library(readr)
mudas <- read_csv("crescimento_mudas_viveiro_USP.csv", locale = locale(encoding = "WINDOWS-1252"))


# verificando a classe de cada variável com str
str(mudas)

# ajustando o tiipo de variável para factor
mudas$especie<- as.factor(mudas$especie)

# calculando a media, mediana e desvio pd por especie
tapply(mudas$altura, mudas$especie, mean)
tapply(mudas$altura, mudas$especie, median)
tapply(mudas$altura, mudas$especie, sd)

# calculando media, mediana e desvio pd por especie e por bloco

mudas$bloco<- as.factor(mudas$bloco)

library(dplyr)

mudas %>%
  group_by(especie, bloco) %>% 
  summarise(media=mean(altura), mediana=median(altura), desvio=sd(altura))

# fazendo o mesmo com tapply
tapply(mudas$altura, list(mudas$especie, mudas$bloco), mean)
tapply(mudas$altura, list(mudas$especie, mudas$bloco), median)
tapply(mudas$altura, list(mudas$especie, mudas$bloco), sd)

