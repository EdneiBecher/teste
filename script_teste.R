library(dplyr)

bolsas2018<- pda_bolsistas_prouni_2018

#verificar as variáveis
glimpse(bolsas2018)

# criando um tabela com as bolsas divididas por modalildade
table(bolsas2018$MODALIDADE_ENSINO_BOLSA)
