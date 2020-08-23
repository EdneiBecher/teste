# carregando o readr
# carregando o arquivo mudas
library(readr)
mudas <- read_csv("crescimento_mudas_viveiro_USP.csv", locale = locale(encoding = "WINDOWS-1252"))


# verificando a classe de cada variável com str
str(mudas)

# ajustando o tiipo de variável para factor
mudas$especie<- as.factor(mudas$especie)

# calculando a media por especie
tapply(mudas$altura, mudas$especie, mean)
