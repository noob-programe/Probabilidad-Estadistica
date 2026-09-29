# datos1 <- c(3.4, 2.5, 4.8, 2.9, 3.6,
#             3.8, 3.3, 6.6, 3.7, 2.8,
#             4.8, 4.5, 4.5, 3.9, 4.0)

# n <- length(datos1)
# print(n)

# stem(datos1)

# print(summary(datos1))

# q1 <- 3.35
# q2 <- 3.80
# q3 <- 4.50
# IQR <- q3 - q1



# print(IQR)

# # 2. Hacer el boxplot básico
# boxplot(datos1, 
#         main = "Mi primer Boxplot", # Título
#         ylab = "Valores",           # Etiqueta del eje Y
#         col = "#3b75e0")          # Color de la caja






datos2 <- c(3.4, 2.5, 4.8, 4.9, 3.6,
            3.8, 3.3, 6.6, 3.7, 2.8,
            4.8, 4.5, 4.5, 3.9, 4.0)

n <- length(datos2)
print(n)
print(summary(datos2))
print(stem(datos2))
print(sum(datos2) / 15)

print(4.65 - 3.5)

boxplot(datos2,
    main = "Boxplot Datos 2",
    ylab = "Valores",
    col = #3b75e0,
)
