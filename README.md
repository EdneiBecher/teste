# teste
respositorio para teste

#script minicurso GGplot
######################################################################################
# Visualização de dados com ggplot2
# III Educa-SER
# Profa: Natalia Paiva - IESC/UFRJ
# Profa assistente: Monica Brochini - Doutoranda PPG Saude Coletiva IESC UFRJ
######################################################################################

# Encoding: UTF-8

### GGPLOT2: 
# O ggplot2 é um pacote originalmente do R, 
# construído para visualização de dados e faz parte da biblioteca Tidyverse, 
# popular em análise de dados e machine learning. 
# Hadley Wickham, cientista chefe do RStudio, e professor de estatística 
# na Universidade de Auckland, Stanford University, e Rice University, 
# desenvolveu o ggplot2 baseado no livro (The Grammar of Graphics), de Leland Wilkinson.


# As funções:
# O pacote possui distintas funções que podem exigir vários minicursos ou horas, por isso,
# vamos explorar as mais básicas nesse momento: 
# ggplot() indicamos o dataset
# aes() indicando as variáveis dos eixos e as características que desejamos: cor, forma, tamanho
# geom() definindo o tipo de gráfico mais adequado:
   #geom_point() – dispersão.
   #geom_histogram() – histogramas.
   #geom_abline() – retas.
   #geom_boxplot() – boxplot.
   #geom_bar() – barras/colunas.

#Prática: dataset mpg embutido no pacote ggplot2

# Instale os pacotes, caso ainda não os tenha instalado em seu pc.
# Lembre-se, instalamos 1 vez na máquina. 
# No entanto, devemos ativá-lo na biblioteca toda vez que formos utilizá-lo.

library(ggplot2) # graficos
library(dplyr) # utilizaremos para manipular a base de dados
library(forcats) # ordenar colunas

#visualizando o banco no console
ggplot2::mpg
#Formato de um conjunto de dados: Data frame com 234 linhas e 11 variáveis

# mais detalhes: https://rpubs.com/shailesh/mpg-exploration

#1 fabricante (manufacturer)
#2 modelo = nome do modelo (model)
#3 displ = cilindrada do motor, em litros ou tamanho do motor
#4 ano = ano de fabricação
#5 cyl = número de cilindros
#6 trans = tipo de transmissão (automatico, manual (vários sub tipos))
#7 drv: f = tração dianteira, r = tração traseira, 4 = tração nas quatro rodas
#8 cty = milhas urbanas por galão
#9 hwy = milhas rodoviárias por galão ou eficiência
#10 fl = tipo de combustível (São eles: diesel, petroleo, eletrico, etc.)
#11 classe = “tipo” de carro (class)

############################################
#  VISUALIZAÇÃO DOS DADOS USANDO GGPLOT2   #
############################################

#Vamos tentar visualizar a relação entre tamanho do motor (displ) e eficiência do carro (hwy)

#------------------------------------DISPERSÃO---------------------------------------------

ggplot2::ggplot(data = mpg) + #data = base de dados (nome do objeto)
  aes(x=displ, y= hwy) + #aes = variáveis
   geom_point() #tipo de gráfico

# Ao que tudo indica quanto maior for o tamanho do motor, menor eficiência do carro
# inversamente proporcionais

# E se eu quiser mudar a cor dos pontos?

ggplot(data = mpg) +
  aes(x = displ, y = hwy) + 
  geom_point(color = "blue")

# Vejam mais cores em http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf

#visualizando de outra maneira

# Vamos ver essa relação para cada ano de fabricação
windows()

ggplot(data = mpg) +
  aes(x=displ, y=hwy) +
  geom_point() +
  facet_wrap(.~year) #visualização em dois quadrantes (pois tenho 2 anos distintos)

#nesse gráfico inserimos a camada facet_wrap usada para visualização em pequenos painéis
#por tamanho do motor e eficiência entre 1999 e 2008
#de um modo geral os carros apresentaram melhor eficiência em 2008 comparado a 1999

#A eficiência melhorou entre 1999 e 2008?

# Vamos criar um gráfico de dispersão entre displ e hwy, e 
# o tamanho dos pontos será proporcional ao valor da variável cyl (número de cilindros)
# essa figura será guardada no objeto p

p <- ggplot(data = mpg) +
  aes(x = displ, y = hwy, size = cyl) + # usamos argumento size
  geom_point()


#Podemos adicionar um título, 
#subtítulo, legenda e editar os títulos dos eixos com a função labs ( ):


p + labs(
  title = "Fuel efficiency for 38 popular models of car",
  subtitle = "Period 1999-2008",
  caption = "Data: ggplot2::mpg. See more at www.statsandr.com",
  x = "Engine displacement (litres)",
  y = "Highway miles per gallon (mpg)",
  size= "Nº of cylinders"
)


# E se eu quiser ver a relação cilindrada do motor x eficiencia conseguindo ver por número de cilindros? 
ggplot(data = mpg) +
  aes(x = displ, y = hwy, colour = factor(cyl)) + # colocando cor por número de cilindros
  geom_point()

# Não gostei dessas cores. Quero mudar!
# valor usar a paleta brewer

ggplot(data = mpg) +
  aes(x = displ, y = hwy, colour = factor(cyl)) + # colocando cor por número de cilindros
  geom_point() +
  scale_color_brewer(palette="Set3")

# vejam mais cores em https://r-graph-gallery.com/38-rcolorbrewers-palettes.html

library(RColorBrewer)
display.brewer.all()

#-------------------------------------geom_bar---------------------------------------------
#não se preocupem agora com a ordem

# Vamos ver a distribuição do tipo de tração (drv)
# legenda:  f=front wheel, r=rear wheel, 4=4 wheel

ggplot(data = mpg) +
  aes(x = drv) +
  geom_bar()

#alterando as cores 

#bordas
ggplot(data = mpg) +
  aes(x = drv) +
  geom_bar(color = "red")

#interior
ggplot(data = mpg) +
  aes(x = drv) +
  geom_bar(color = "red", fill = "white")

#ambas
ggplot(data = mpg) +
  aes(x = drv) +
  geom_bar(color ="purple", fill = "purple")


#podemos criar um barplot:
ggplot (data = mpg) +
  aes (x = class) +  # tipo do carro
  geom_bar ()

#ordenando as colunas com fct_infreq (por frequencia; pacote forcats)
ggplot(data = mpg) +
  aes (x = fct_infreq(class)) + 
  geom_bar()

#inserindo cores 
ggplot(data = mpg) +
  aes(x = fct_infreq(class)) +
  geom_bar(fill = "red")

#inserindo os dados na horizontal (barras)
ggplot(data = mpg) +
  aes(x = fct_infreq(class)) +
  geom_bar(fill = "tomato") +
  coord_flip() # este comando faz o gráfico de coluna, virar barra

# distribuicao do tipo de carro e inserindo cores por ano
ggplot(data = mpg) +
  aes (x = class, fill = factor(year)) +
  geom_bar()

# Um gráfico de coluna para tração segundo modelo com titulo e afins

#barplot
ggplot(data = mpg) +
  aes (x = fct_infreq(drv), fill = class) +
  geom_bar() + 
  labs(
    title = "Tipo de tração por modelo",
    subtitle = "Periodo 1999-2008",
    caption = "Data: ggplot2::mpg. Explore em www.statsandr.com",
    x = "Tração",
    y = "Frequência",
    fill = "Modelo"
  )


# e se eu quiser do menor para maior? use o argumento fct_rev

#barplot
ggplot(data = mpg) +
  aes (x = fct_rev(fct_infreq(drv))) +
  geom_bar() 

#Podemos transformar (recodificar) a variável tração:
#verificando a classe e levels
class(mpg$drv)
table(mpg$drv)

#Levels: 
#7 drv f = tração dianteira, r = tração traseira, 4 = tração nas quatro rodas

#tranformando
mpg <- mpg %>%
  mutate(drv = recode(drv,"4" = "Quatro rodas",
                      "f" = "Dianteira",
                      "r" = "Traseira"))
#conferindo
table(mpg$drv)

#recodificamos os lables da variável usando mutate e recode do dplyr

#refazendo o gráfico
ggplot(data = mpg) +
  aes (x = drv, fill = class) +
  geom_bar() + 
  labs(
    title = "Tipo de tração por modelo",
    subtitle = "Periodo 1999-2008",
    caption = "Data: ggplot2::mpg. Explore em www.statsandr.com",
    x = "Tração",
    y = "Frequência",
    fill = "Modelo"
  )

# E se eu quiser colunas lado a lado, e nao empilhadas?
# Use position=position_dodge()

# Tração segundo ano de fabricação
ggplot(data = mpg) +
  aes (x = drv, fill = factor(year)) +
  geom_bar(position=position_dodge())


# se quiser ver essa relação para cada modelo?
# use: facet_wrap

ggplot(data = mpg) +
  aes (x = drv, fill = factor(year)) +
  geom_bar(position=position_dodge()) +
  facet_wrap(. ~class) # note que as escalas no eixo Y são as mesmas

# Como deixar as escladas livres?
# Use: scales = "free"

ggplot(data = mpg) +
  aes (x = drv, fill = factor(year)) +
  geom_bar(position=position_dodge()) +
  facet_wrap(. ~class, scales = "free") 


#---------------------------------------BOXPLOT--------------------------------------------

#Boxplot
ggplot(data = mpg) +
  aes(y = hwy) +
  geom_boxplot()

#podemos interpretar que a mediana está mais próxima do primeiro quartil do que do centro?
#vamos tentar melhorar a qualidade do gráfico?


#Nesse tipo de gráfico podemos inserir no eixo x uma variável categórica
# e em y variável contínua

#eficiência x classe do carro
ggplot(data = mpg) +
  aes(x = class, y = hwy) +
  geom_boxplot()

#Os carros compatos (e sub) e midsize apresentam maior variabilidade de eficiência comparado aos
#demais modelos, apesar dos outliers os SUV e as Pickups apresentam a menor variabilidade 
#de eficiência 

#vamos tentar melhorar a qualidade do gráfico?

#inserindo cor para cada classe de carros

ggplot(data = mpg) +
  aes(x = class, y = hwy, fill = class) + #cor (borda e preechimento)
  geom_boxplot()

#mudando cor para cada classe de carros - paleta brewer

ggplot(data = mpg) +
  aes(x = class, y = hwy, fill = class) + #cor (borda e preechimento)
  geom_boxplot() +
  scale_fill_brewer(palette="Set1")


ggplot(data = mpg) +
  aes(x = class, y = hwy, color = class) + #borda
  geom_boxplot()

#incluindo a dispersão dos dados
ggplot(data = mpg) +
  aes(x = class, y = hwy, fill = class) + # cor nas caixas com fill
  geom_boxplot(varwidth = TRUE) +
  geom_jitter(alpha = 0.25) + #adiciona a distribuição das obs
  theme(legend.position = "none") # remove legenda


#geom_jitter(alpha = estética, width/height = largura e altura)



#-------------------------------------DENSIDADE--------------------------------------------

#Esses parâmetros estéticos alteram a cor (color e fill) e a opacidade ( alpha) 
#dos elementos geom em um gráfico em geral:
#color = linha externa
#fill = interior
#Mas no gráfico acima como indicamos uma variável 
#as cores foram distribuídas nos levels

#Density plot de uma variável contínua
ggplot(mpg, aes(x = hwy)) +
  geom_density()

#Density plot de uma variável contínua
ggplot(mpg, aes(x = hwy)) +
  geom_density(fill = "yellow")

# Density plot de uma variável contínua
ggplot(mpg, aes(x = hwy)) +
  geom_density(fill = "lightblue", alpha = 0.3, color = "red")

ggplot(mpg, aes(x = hwy)) +
  geom_density(fill = "lightblue", alpha = 0.7, color = "red")


#Desnity plot com cores para diferentes categorias sem sobreposição
ggplot(mpg, aes(x = hwy, fill = class)) +
  geom_density() +
  ggtitle("Sem sobreposiçao")

# Desnity plot com cores para diferentes categorias com sobreposição
ggplot(mpg, aes(x = hwy, fill = class)) +
  geom_density(alpha = .6) +
  ggtitle("Com sobreposiçao")

#é possível abrir nova janela ou abrir na anterior
#windows()

ggplot(data = mpg) +
  aes(x = hwy, color = class, fill = class) + 
  geom_density(alpha = 0.25) #transparencia

#inserindo títulos

ggplot(data = mpg) +
  aes(x = hwy, color = drv, fill = drv) + 
  geom_density(alpha = 0.25) + #transparencia
  labs(
    title = "Eficiência segundo tipo de tração",
    subtitle = "Periodo 1999-2008",
    caption = "Data: ggplot2::mpg. Explore em www.statsandr.com",
    x = "Eficiência",
    y = "Densidade"
  )


#---------------------------------------HISTOGRAMA--------------------------------------------

ggplot(data = mpg) +
  aes(x = hwy) + # milhas rodoviárias por galão ou eficiência
  geom_histogram(bins = 30) 

# mudando cor
ggplot(data = mpg) +
  aes(x = hwy) + # milhas rodoviárias por galão ou eficiência
  geom_histogram(bins = 30, fill= "gray") 

# Vamos mudar o plano de fundo? Vamos mudar o theme
ggplot(data = mpg) +
  aes(x = hwy) +  
  geom_histogram(bins = 30, fill= "gray") +
  theme_classic()

ggplot(data = mpg) +
  aes(x = hwy) + 
  geom_histogram(bins = 30) +
  theme_bw()

ggplot(data = mpg) +
  aes(x = hwy) + 
  geom_histogram(bins = 30) +
  theme_minimal()
