 ednei
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

# calculando media, mediana e desvio pd por especie e por bloco e substrato

mudas$bloco<- as.factor(mudas$bloco)
mudas$substrato<- as.factor((mudas$substrato))

library(dplyr)

mudas %>%
  group_by(especie, bloco, substrato) %>% 
  summarise(media=mean(altura), mediana=median(altura), desvio=sd(altura))


# fazendo o mesmo com tapply
# também é possivel incluir na.rm=TRUE no final, depois da função para remover NAs
tapply(mudas$altura, list(mudas$especie, mudas$bloco, mudas$substrato), mean)
tapply(mudas$altura, list(mudas$especie, mudas$bloco), median)
tapply(mudas$altura, list(mudas$especie, mudas$bloco), sd)


# fazendo o boxplot

boxplot(mudas$altura)
boxplot(altura~especie, data=mudas)


# boxplot com ggplot e dplyr

library(ggplot2)

mudas %>% 
  group_by(especie) %>% 
  ggplot(aes(x= especie, y=altura))+geom_boxplot()+
  facet_wrap(~bloco)

