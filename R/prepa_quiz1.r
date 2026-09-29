# 1. Cargar vector de 40 datos
datos2 <- c(
  10, 12, 14, 15, 17, 18, 19, 20, 21, 22,
  23, 25, 26, 27, 28, 29, 30, 31, 32, 34,
  35, 36, 37, 38, 39, 40, 41, 42, 44, 45,
  46, 48, 49, 50, 52, 54, 55, 57, 58, 60
)

# Summary individual
summary(datos2)

# 2. Parámetros de la agrupación
n <- length(datos2)
rango <- max(datos2) - min(datos2)
k_exacto <- log(n + 1)
k_clases <- round(k_exacto) # 4 clases

# Amplitud = Rango / Clases
amplitud <- rango / k_clases # 50 / 4 = 12.5

cat("Clases (k):", k_clases, "\n")
cat("Amplitud (A):", amplitud, "\n")

# 3. Datos agrupados manualmente según la tabla
m_i <- c(16.25, 28.75, 41.25, 53.75)
f_i <- c(10, 10, 11, 9)

# Media agrupada
media_agr <- sum(m_i * f_i) / n

# Mediana agrupada
L_med <- 22.5
F_ant <- 10
f_med <- 10
mediana_agr <- L_med + ((n/2 - F_ant) / f_med) * amplitud

# Moda agrupada
L_mod <- 35.0
d1 <- 11 - 10
d2 <- 11 - 9
moda_agr <- L_mod + (d1 / (d1 + d2)) * amplitud

# Variabilidad agrupada
var_agr <- sum(f_i * (m_i - media_agr)^2) / (n - 1)
sd_agr <- sqrt(var_agr)
cv_agr <- (sd_agr / media_agr) * 100

# Chebyshev (k = 2)
lim_inf2 <- media_agr - 2 * sd_agr
lim_sup2 <- media_agr + 2 * sd_agr

cat("\n--- RESULTADOS DATOS AGRUPADOS ---\n")
cat("Media agrupada:", media_agr, "\n")
cat("Mediana agrupada:", mediana_agr, "\n")
cat("Moda agrupada:", moda_agr, "\n")
cat("Varianza agrupada:", var_agr, "\n")
cat("Desviación Estándar agrupada:", sd_agr, "\n")
cat("CV agrupado (%):", cv_agr, "\n")
cat("Intervalo Chebyshev (k=2): [", lim_inf2, ",", lim_sup2, "]\n")