
#simulacion dados
lanzamientos <- sample(1:6, size=100, replace=TRUE)

#ver cuantas veces salio cara
table(lanzamientos)

#graficar resultados
barplot(table(lanzamientos), col = "steelblue", main = "Lanzamiento dados")

