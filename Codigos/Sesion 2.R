# Sesion 2 Curso Basico R

rm(list=ls())

##########################################################
#############   Martes 14 de Julio 2020   ################
#############   Laboratorio Fintrade           ################
#############                             ################
##########################################################


## Contenido

# Ubicando dirección URL del Github
# Tipos de Archivos
# Creacion de vectores y matrices
# Bases de datos con variables categoricas, numericas o caracteres
# Filtrar datos


## Ubicando Dirección URL CSV 
library(RCurl)# La dirección web
library(readr)# La base de datos en cvs o txt

text=getURL("https://raw.githubusercontent.com/Fintrade2020/Curso-R-Basico/master/Bases/2019H.csv")

HAP19 <- read_csv(file=text)

summary(HAP19)


#Vectores y matrices

class(HAP19)

#### Este comando class corrobora que tipo de base de datos es .. en este caso es un 
### data frame y se puede extraer las variables de esa base de datos creando 
### un vector

a=HAP19$Score # este es un vector 

class(a) #este vector es numerico

## si se quieren meter más datos en un mismo vector, se realiza:

b=HAP19[,3:8]

#En este vector se coloca una coma porque primero van las filas y luego las columnas 
# Si se quieren extraer las filas se hace de la siguiente manera

b=HAP19[1:6,3:8]

##En dado caso que se quisiera quitar alguna variable dentro del vector b, se procede a:

b=b[,1:4]


### A continuación se realizará un vector con números aleatorios normales

b$NORM=rnorm(1)


#si quiero cambiar el data frame a matriz es:

c=as.matrix(b)

#La diferencia entre un dataframe y una matriz es las matrices almacenan un unico tipo de datos, mientras 
#que los data frames pueden contener distintos tipos de datos.

#Para poder cambiar el nombre de las variables que son largas, se hace lo siguiente:

colnames(c)=c("a","b","c","d","e")

head(HAP19)
tail(HAP19)

#Posteriormente, la funcion unique sirve para saber que contiene la columna, esta principalmente
#sirve cuando una columna tiene varios nombres repetidos.

unique(HAP19$`Country or region`)

#Funcion para crear filtros
library(dplyr)
d=filter(HAP19,`Country or region`=="Denmark")

###Si se quiere filtrar dos países se procede a:

e=filter(HAP19,`Country or region`=="Denmark"|`Country or region`=="Finland")

## Por otro lado, otra alternativa para filtrar datos es la siguiente:

f=filter(HAP19,`Country or region`=="Denmark",Generosity>0.2)



### Dentro de una base de datos que contiene numerosas columnas, para cambiar el nombre
### de solo una variables se hace:

colnames(HAP19)[4]="PIB"



## Luego si se tiene una base de datos en formato excel, se hace lo siguiente:

library(readxl)
bc <- read_excel("C:/Users/User/Desktop/Bases/bc.xlsx")
View(bc)
