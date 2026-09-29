#1. Ramas y hojas

tiempo_anuncios_8A <- c(241, 218, 237, 220, 194, 225, 248, 123, 195, 249)

#Calcular ramas y hojas + escala    
stem(tiempo_anuncios_8A, scale =2)

#Calcular promedio
mean(tiempo_anuncios_8A)

#Calcular todo en 1: media, mediana, mínimo, máximo y cuartiles
summary(tiempo_anuncios_8A)


#Columna 8B

tiempo_anuncios_8B <- c(241, 208, 237, 220, 124, 225, 218, 203, 145, 249)

#n elementos de 8B
length(tiempo_anuncios_8B)

#Ramasy hojas 8B
stem(tiempo_anuncios_8B, scale = 2)

#resumen 8B
summary(tiempo_anuncios_8B)

#Organizar de menor a mayor
sort(tiempo_anuncios_8B)

#Organizar de mayor a menor

sort(tiempo_anuncios_8B, decreasing = TRUE)



#Medidas de dispersión o variabilidad de las variables 

tiempo_anuncios_8A <- c(241, 218, 237, 220, 194, 225, 248, 123, 195, 249)
tiempo_anuncios_8B <- c(241, 208, 237, 220, 124, 225, 218, 203, 145, 249)

#Variabilidad
var(tiempo_anuncios_8A)
var(tiempo_anuncios_8B)


#Desviación Estandar
sd(tiempo_anuncios_8A)
sd(tiempo_anuncios_8B)

#Coeficiente de variación
(sd(tiempo_anuncios_8A)/mean(tiempo_anuncios_8A)) * 100
(sd(tiempo_anuncios_8B)/mean(tiempo_anuncios_8B)) * 100



#DATOS AGRUPADOS
datos_8a <- c(241, 218, 237, 220, 194, 225, 248, 123, 195, 249,
              220, 194, 245, 209, 221, 195, 255, 245, 205, 200,
              249, 251, 238, 210, 198, 201, 183, 213, 236, 215,
              209, 212, 125, 187, 218, 190, 175, 148, 135, 190)


n <- length(datos_8a)

k_atuo <- nclass.Sturges(datos_8a)
k_atuo

k1 <- 1 + 3.322*(log10(n))
k2 <- 1 + log2(n)
log(41)

132 /5

#TABLAS DE FRECUENCIAS CON PAQUETE
install.packages("fdth")

library(fdth)

tabla <- fdt(datos_8a)

print(tabla)

#

w <- 26.4



sum(datos_8a >= 228.6)



datos_8b <- c(241, 208, 237, 220, 124, 225, 218, 203, 145, 249,
              220, 174, 245, 219, 291, 125, 235, 215, 235, 210,
              229, 251, 238, 220, 188, 189, 173, 203, 216, 245,
              219, 212, 185, 187, 208, 170, 165, 178, 165, 170)


print("clase1")

sum(datos_8b>=124 & datos_8b<157.4)

sum(datos_8b>=157.4 & datos_8b<190.8)

sum(datos_8b>=190.8 & datos_8b<224.2)

sum(datos_8b>=224.2 & datos_8b<257.6)

sum(datos_8b>=257.6 & datos_8b<= 291)
