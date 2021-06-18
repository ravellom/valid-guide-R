### Capítulo 1. ANÁLISIS EXPLORATORIO DE LOS DATOS CON R
### Raidell Avello - Última actualización 14.06.2021
### Colaboradores
#### - Juan Pérez Gómez, Institución, Ciudad, País (Script R, Apartado 2.2)

# Datos de ejemplo http://openpsychometrics.org/_rawdata/IQ1.zip 

iq1 <- read.csv("C:/Users/Admin/Documents/GitHub/valid-guide-R/Ch01/data.csv")

# Describir variables con el paquete psych
psych::describe(iq1)

# Descibir con pastecs
datos <- pastecs::stat.desc(iq1[,1:6], basic = FALSE, norm = TRUE)
round(datos, 3)

# Imprimir las primeras filas del dataframe
head(iq1[,1:10])

#Graficar frecuencia de las respuestas usando el paquete likert
library(dplyr)
library(likert)
# Transformar las variables enteras a factores 
# y se pasa a la función likert
r <- iq1[,10:19] %>% mutate_if(is.integer, as.factor) %>% likert()
plot(r)

## Codificar items en sentido contrario (reversa)
library(car)
# Recodificar item 5:".difficult to use"
# No usar dplyr::recode()!
# La respuesta "3" se queda igual "3"!
data <- c(2,3,1,4,3)
data_recod <- car::recode(data, "1 = 5; 2 = 4; 4 = 2; 5 = 1")

## Correlaciones
library(psych)
corr.test(iq1[,1:5])

# Graficar las correlaciones con el paquete corrplot
library(corrplot)
corrplot(cor(iq1[,10:20]), method = "circle")


## Eliminar duplicados de un dataframe
sexo <- c(rep("hombre",5),rep("mujer",5))
pais <- c(rep("francia",3),rep("italia",3),rep("portugal",4))
datos <- data.frame(sexo=sexo,pais=pais)
head(datos, n=10)
datos[!duplicated(datos), ]

#Otra forma
library(dplyr)
distinct(datos)

#Contar duplicados
nrow(datos[duplicated(datos), ])

# Trabajo con valores NA o valores nulos
id <- c(1,4,3,NA,7,6,9,4,0,8)
texto <- c("a", "b", NA, "NA","a","b","b","b","c","d")
valor <- c(2,8,7,5,1,9,4,3,7,2)
datos <- data.frame(id=id,texto=texto,valor=valor)
head(datos, n=10)

#Contar número de nulos por columna
sapply(datos, function(x) sum(is.na(x)))
#Eliminar filas con nulos en una columna concreta
datos <- datos[!is.na(datos$id),]
datos <- datos[!is.na(datos$texto),]
head(datos, n= 8)

# Eliminar todas las filas que contengan algun valor nulo
datos <- na.omit(datos)

