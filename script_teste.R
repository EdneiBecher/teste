library(dplyr)

bolsas2018<- pda_bolsistas_prouni_2018

#verificar as variáveis
glimpse(bolsas2018)

# criando um tabela com as bolsas divididas por modalildade
table(bolsas2018$MODALIDADE_ENSINO_BOLSA)


oso<- c(lon = -29.8926, lat = -50.2633)

oso_map<- get_map(location = oso, zoom = 8)

oso_map_stamen<- get_map(oso, zoom=12, maptype = "toner", source = "stamen")

ggmap(get_stamenmap(rbind(as.numeric(paste(geocode_OSM("Porto Alegre")$bbox))), zoom = 10))


bbox <- c(left = -97.1268, bottom = 31.536245, right = -97.099334, top = 31.559652)
usa<- c("left" = -125, "bottom" = 25.75, "right" = -67, "top" = 49)
ggmap(get_stamenmap(usa, zoom = 10))
c("left" = -125, "bottom" = 25.75, "right" = -67, "top" = 49)ggmap(get_stamenmap(bbox, zoom = 14, maptype = "terrain"))
ggmap(get_stamenmap(bbox, zoom = 11, maptype = "toner"))
ggmap(get_stamenmap(bbox, zoom = 14, maptype = "watercolor"))
ggmap(get_stamenmap(bbox, zoom = 14, maptype = "toner-2010"))
ggmap(get_stamenmap(bbox, zoom = 14, maptype = "terrain-lines"))

library(ggplot2)
library(ggmap)
library(caret)
data(Sacramento)
height <- max(Sacramento$latitude) - min(Sacramento$latitude)
width <- max(Sacramento$longitude) - min(Sacramento$longitude)
sac_borders <- c(bottom  = min(Sacramento$latitude)  - 0.1 * height, 
                 top     = max(Sacramento$latitude)  + 0.1 * height,
                 left    = min(Sacramento$longitude) - 0.1 * width,
                 right   = max(Sacramento$longitude) + 0.1 * width)

map <- get_stamenmap(sac_borders, zoom = 10, maptype = "toner-lite")

ggmap(map)


#Verificando as variáveis
library(dplyr)
glimpse(mudas)
