# Carregar Data Frame

mudas<- read.csv("crescimento_mudas_viveiro_USP.csv")

# Média
tapply(mudas$altura, mudas$especie, mean)
