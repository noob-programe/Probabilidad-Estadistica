import pandas as pd
import numpy as np
import matplotlib.pyplot as plt


# ============================================================
# 1. CARGA Y SELECCIÓN DE LOS DATOS
# ============================================================

df = pd.read_csv('netflix_customer_churn.csv')

tiempo_visualizacion = df['avg_watch_time_per_day']

n = tiempo_visualizacion.count()


# ============================================================
# 2. PARÁMETROS DE LOS DATOS AGRUPADOS
# ============================================================

# Número de clases
k_clases = round(np.log(n + 1))

# Valores extremos
minimo = tiempo_visualizacion.min()
maximo = tiempo_visualizacion.max()

# Rango
rango = maximo - minimo

# Amplitud
amplitud = round(rango / k_clases)

# Intervalos utilizados en el ejercicio
intervalos = [0, 11, 22, 33, 44, 55, 66, 77, 88, 99]


# ============================================================
# 3. FRECUENCIAS
# ============================================================

clases = pd.cut(
    tiempo_visualizacion,
    bins=intervalos,
    right=False
)

frecuencia_absoluta = clases.value_counts().sort_index()

frecuencia_acumulada = frecuencia_absoluta.cumsum()


# ============================================================
# 4. MARCA DE CLASE
# ============================================================

marcas_clase = np.array([
    (intervalos[i] + intervalos[i + 1]) / 2
    for i in range(len(intervalos) - 1)
])


# ============================================================
# 5. MEDIA PARA DATOS AGRUPADOS
# ============================================================

promedio = (
    np.sum(marcas_clase * frecuencia_absoluta.values)
    / n
)


# ============================================================
# 6. MEDIANA PARA DATOS AGRUPADOS
# ============================================================

posicion_mediana = n / 2

indice_mediana = np.where(
    frecuencia_acumulada.values >= posicion_mediana
)[0][0]

limite_inferior_mediana = intervalos[indice_mediana]

frecuencia_mediana = frecuencia_absoluta.iloc[indice_mediana]

if indice_mediana == 0:
    frecuencia_acumulada_anterior = 0
else:
    frecuencia_acumulada_anterior = frecuencia_acumulada.iloc[
        indice_mediana - 1
    ]

mediana = (
    limite_inferior_mediana
    + (
        (posicion_mediana - frecuencia_acumulada_anterior)
        / frecuencia_mediana
    ) * amplitud
)


# ============================================================
# 7. DESVIACIÓN ESTÁNDAR MUESTRAL
# ============================================================

suma_cuadrados = np.sum(
    frecuencia_absoluta.values
    * (marcas_clase - promedio) ** 2
)

varianza_muestral = suma_cuadrados / (n - 1)

desviacion_estandar = np.sqrt(varianza_muestral)


# ============================================================
# 8. COEFICIENTE DE VARIACIÓN
# ============================================================

coeficiente_variacion = (
    desviacion_estandar / promedio
) * 100


# ============================================================
# 9. TEOREMA DE CHEBYSHEV
# ============================================================

k_chebyshev = 2

porcentaje_chebyshev = (
    1 - (1 / k_chebyshev ** 2)
) * 100

limite_chebyshev_inferior = (
    promedio - k_chebyshev * desviacion_estandar
)

limite_chebyshev_superior = (
    promedio + k_chebyshev * desviacion_estandar
)


# ============================================================
# 10. MOSTRAR RESULTADOS
# ============================================================

print("=" * 60)
print("ANÁLISIS ESTADÍSTICO - NETFLIX")
print("=" * 60)

print(f"\nTamaño de la muestra: {n}")
print(f"Número de clases: {k_clases}")
print(f"Rango: {rango:.2f}")
print(f"Amplitud: {amplitud}")

print(f"\nMedia agrupada: {promedio:.3f}")
print(f"Mediana agrupada: {mediana:.3f}")
print(f"Desviación estándar: {desviacion_estandar:.3f}")
print(f"Coeficiente de variación: {coeficiente_variacion:.2f}%")

print("\n--- Teorema de Chebyshev ---")
print(f"k = {k_chebyshev}")
print(f"Mínimo garantizado: {porcentaje_chebyshev:.2f}%")
print(
    f"Intervalo: "
    f"[{limite_chebyshev_inferior:.3f}, "
    f"{limite_chebyshev_superior:.3f}]"
)


# ============================================================
# 11. GRÁFICO FINAL
# ============================================================

fig, ax = plt.subplots(figsize=(13, 7))

# Histograma usando las clases del ejercicio
ax.hist(
    tiempo_visualizacion,
    bins=intervalos,
    edgecolor='black',
    alpha=0.75,
    rwidth=0.98
)


# ------------------------------------------------------------
# Media
# ------------------------------------------------------------

ax.axvline(
    promedio,
    linestyle='--',
    linewidth=2,
    label=f'Media = {promedio:.2f} h'
)


# ------------------------------------------------------------
# Mediana
# ------------------------------------------------------------

ax.axvline(
    mediana,
    linestyle=':',
    linewidth=2.5,
    label=f'Mediana = {mediana:.2f} h'
)


# ------------------------------------------------------------
# Límites de Chebyshev
# ------------------------------------------------------------

ax.axvline(
    limite_chebyshev_inferior,
    linestyle='-.',
    linewidth=1.8,
    label=f'Chebyshev inferior = {limite_chebyshev_inferior:.2f} h'
)

ax.axvline(
    limite_chebyshev_superior,
    linestyle='-.',
    linewidth=1.8,
    label=f'Chebyshev superior = {limite_chebyshev_superior:.2f} h'
)


# ------------------------------------------------------------
# Título y etiquetas
# ------------------------------------------------------------

ax.set_title(
    'Distribución del tiempo promedio de visualización diaria',
    fontsize=16,
    fontweight='bold',
    pad=15
)

ax.set_xlabel(
    'Tiempo promedio de visualización por día (horas)',
    fontsize=12
)

ax.set_ylabel(
    'Frecuencia',
    fontsize=12
)


# ------------------------------------------------------------
# Cuadrícula
# ------------------------------------------------------------

ax.grid(
    axis='y',
    linestyle='--',
    alpha=0.3
)


# ------------------------------------------------------------
# Leyenda
# ------------------------------------------------------------

ax.legend(
    loc='upper right',
    frameon=True
)


# ------------------------------------------------------------
# Información estadística dentro del gráfico
# ------------------------------------------------------------

texto = (
    f'n = {n:,}\n'
    f'k = {k_clases} clases\n'
    f'CV = {coeficiente_variacion:.2f}%\n'
    f'Chebyshev (k=2): ≥ {porcentaje_chebyshev:.0f}%'
)

ax.text(
    0.98,
    0.72,
    texto,
    transform=ax.transAxes,
    fontsize=10,
    verticalalignment='top',
    horizontalalignment='right',
    bbox=dict(
        boxstyle='round,pad=0.5',
        alpha=0.85
    )
)


plt.tight_layout()

plt.show()