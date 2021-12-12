####CAPACITACIÓN INTERNA AMP 07 - VISUALIZACIÓN DE DATOS CON R ####
#############HISTOGRAMA - ELÍAS ABURTO CAMACLLANQUI################


#PRESENTACIÓN BÁSICA DE UN HISTOGRAMA

#Paso 1. Abrir los paquetes
library(tidyverse)
library(patchwork)

#Paso 2. Importar datos
data <- read_csv(file = "data3_clean.csv")

#Paso 3. Cargar datos en ggplot
ggplot(data)

#Paso 4. Indicar la variable de análisis
ggplot(data, aes(x = ase_total))

#Paso 5. Señalar que se trabajará con un gráfico de histograma
ggplot(data, aes(x = ase_total)) +
  geom_histogram()

#PERSONALIZACIÓN DE UN HISTOGRAMA

#Paso 6. Amplitud de intervalo utilizando la regla de Sturges.

#function(x) (max(x)-min(x))/nclass.Sturges(x)

ggplot(data, aes(x = ase_total)) +
  geom_histogram(binwidth = 7)


ggplot(data, aes(x = ase_total)) +
  geom_histogram(binwidth = function(x) (max(x)-min(x))/nclass.Sturges(x))


#Paso 7. Color y relleno.

ggplot(data, aes(x = ase_total)) +
  geom_histogram(binwidth = function(x) (max(x)-min(x))/nclass.Sturges(x),
                 color = "black",
                 fill = "skyblue")

#Paso 8. Tema

ggplot(data, aes(x = ase_total)) +
  geom_histogram(binwidth = function(x) (max(x)-min(x))/nclass.Sturges(x),
                 color = "black",
                 fill = "skyblue") +
  theme_classic()

#Paquetes adicionales para elegir otros temas 
#install.packages('ggthemes'))
#library(ggthemes)
#install.packages('hrbrthemes')
#library(hrbrthemes)
#install.packages('ggpomological')
#library(ggpomological)


#Paso 9. Anotaciones (labs)
ggplot(data, aes(x = ase_total)) +
  geom_histogram(binwidth = function(x) (max(x)-min(x))/nclass.Sturges(x),
                 color = "black",
                 fill = "skyblue") + 
  labs(
    title = "Distribución de puntajes de Autoeficacia Académica",
    subtitle = "Base de datos de Rohmani & Andriani (2021)",
    x = "Autoeficacia Académica",
    y = "Frecuencia",
    caption  = "Avances en Medición Psicológica") +
  theme_classic()

#Paso 10. Utilizar facet_wrap para visualizar según un 
#         tipo de variable categórica
ggplot(data, aes(x = ase_total)) +
  geom_histogram(binwidth = function(x) (max(x)-min(x))/nclass.Sturges(x),
                 color = "black",
                 fill = "skyblue") + 
  labs(
    title = "Distribución de puntajes de Autoeficacia Académica según el sexo",
    subtitle = "Base de datos de Rohmani & Andriani (2021)",
    x = "Autoeficacia Académica",
    y = "Frecuencia",
    caption  = "Avances en Medición Psicológica") +
  facet_wrap(vars(sexo)) + 
  theme_classic()


#CAPACITACIÓN INTERNA - PRÁCTICA 2. HISTOGRAMA

#Construya un histograma con las puntuaciones totales del Burnout (bur_total) 
#   y segmente a la población según el tipo de convivencia (convive).
#   Además, considere las siguientes indicaciones:

# - Utilizar la regla de sturges para hallar la amplitud del intervalo de clase.
# - El color y el relleno deberán ser distintos a la presentación inicial.
# - Titule el eje x con el nombre "Burnout" y 
#   el eje Y con el nombre "Frecuencia".
# - En los comentarios coloque sus nombres y apellidos.


#SOLUCIÓN
ggplot(data, aes(x = bur_total)) +
  geom_histogram(binwidth = function(x) (max(x)-min(x))/nclass.Sturges(x),
                 color = "green",
                 fill = "yellow") + 
  labs(
    title = "Distribución de puntajes de Autoeficacia Académica según el tipo de convivencia",
    subtitle = "Base de datos de Rohmani & Andriani (2021)",
    x = "Burnout",
    y = "Frecuencia",
    caption  = "Elías Aburto Camacllanqui") +
  facet_wrap(vars(convive)) + 
  theme_classic()
