#1 Seleccionar muestra de 7
sample(1:56, 7, replace = FALSE)

n_7 <- c(4.1, 3.8, 4, 3.8, 4.2, 41, 3.6)

sort(n_7)

stem(n_7, scale = 5)

summary(n_7)

sum(n_7 / length(n_7))

promedio <- 9.214
sumatoria <- 0

for (val  in n_7){

    diferencia_2 <- (val - promedio)^2
    sumatoria = sumatoria + diferencia_2

    print(diferencia_2)

}

print(sumatoria)

variacion <- sumatoria / 6
sd(n_7)

cv <- ((sd(n_7) / promedio) * 100)
print(cv)

print(variacion)

boxplot(n_7,
    main = "Notas APA para n = 7",
    ylab = "Notas",
    col = #3b75e0,
)

boxplot(n_7,
        log = "y",
        main = "Notas APA para n = 7",
        ylab = "Notas (Escala Logarítmica)",
        col = "#3b75e0")


# 1. Guardamos las posiciones en 'bp' y ampliamos un poco el límite de Y a 48
bp <- barplot(n_7,
              names.arg = paste("Obs", 1:7),
              main = "Notas APA para n = 7",
              ylab = "Notas",
              col = "#3b75e0",
              ylim = c(0, 48))

# 2. Añadimos el texto sobre cada barra
text(x = bp, y = n_7, labels = n_7, pos = 3)


#----------------------------------------------------------#
#2. Muestra n = 10 ! 

sample(1:56, 10, replace = FALSE)

n_10 <- c(4.8, 3.8, 4.3, 4.3, 4.5, 4.3, 3.8, 3.8, 3.9, 3.3)

tamaño <- length(n_10)
print(tamaño)

n_10 <- sort(n_10)

print(n_10)

print(summary(n_10))
print(sum(n_10))

((3.9 + 4.3) / 2)

print(table(n_7))
print(table(n_10))

sumatoria =  0 
promedio <- 4.08

for(val in n_10){
    diferencia <- val - promedio
    print(diferencia^2)
    diferencia = diferencia^2
    sumatoria = sumatoria + diferencia
}

print((sumatoria / 9)^(1/2))

# 1. Crear el boxplot
boxplot(n_10,
        main = "Promedio PAPA para n = 10",
        ylab = "Notas",
        col = "#3b75e0",
        ylim = c(3.0, 5.0))

# 2. Extraer los 5 valores estadísticos clave
valores <- boxplot.stats(n_10)$stats
etiquetas <- c("Mín: 3.3", "Q1: 3.8", "Mediana: 4.1", "Q3: 4.3", "Máx: 4.8")

# 3. Dibujar las etiquetas a la derecha de la caja
text(x = 1.25, y = valores, labels = etiquetas, pos = 4, font = 2)


# 1. Crear el gráfico de barras guardando las posiciones en 'bp'
bp <- barplot(n_10,
              names.arg = paste("Obs", 1:10),
              main = "Promedio PAPA para n = 10",
              ylab = "Notas",
              col = "#3b75e0",
              ylim = c(0, 5.5))

# 2. Poner los valores individuales sobre cada barra
text(x = bp, y = n_10, labels = n_10, pos = 3)

# 3. Dibujar la línea horizontal en el promedio (4.08)
abline(h = 4.08, col = "red", lwd = 2, lty = 2)

# 4. Agregar la leyenda explicativa en la esquina superior derecha
legend("topright", 
       legend = "Promedio = 4.08", 
       col = "red", 
       lty = 2, 
       lwd = 2, 
       bty = "n")



#Análisis de Datos Agrupados! 

datos_agrupados <- c(
  4.3, 4.1, 3.9, 4, 4.3, 4, 3.8, 4, 3.9, 4.1,
  3.6, 4.6, 3.8, 3.3, 4.3, 3.9, 3.8, 4, 3.8, 4.3,
  4, 4.5, 4, 4.8, 4.4, 4.7, 3.9, 3.8, 4.2, 3.8,
  4.3, 3.9, 3.9, 4.1, 4, 4, 4.1, 3.3, 4.3, 3.8,
  3.6, 4.6, 4.2, 4, 4.5, 3.9, 4.2, 4.7, 4, 4.1,
  3.8, 4.2, 3.8, 3.8, 3.6, 3.8
)

print(length(datos_agrupados))
print(max(datos_agrupados))
print(min(datos_agrupados))

print(max(datos_agrupados) - min(datos_agrupados))

cortes <- seq(3.3, 4.8, by = 0.3)

print(cortes)

intervalos<- cut(datos_agrupados, 
    breaks = cortes, 
    right = FALSE, 
    include.lowest = TRUE)

frec_absoluta <- table(intervalos) 
print(frec_absoluta)


print(sort(datos_agrupados))

conteo_intervalos <- sum(datos_agrupados >= 3.776 & datos_agrupados <= 4.398)
print(conteo_intervalos)