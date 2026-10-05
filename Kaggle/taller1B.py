import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

df = pd.read_csv('netflix_customer_churn.csv')
tiempo_visualizacion = df['avg_watch_time_per_day']

#MUESTRA
N = tiempo_visualizacion.count()

print("Tamaño de la población:", N)

# print(tiempo_visualizacion.head()) #Verificamos el inicio de nuestra variable

#2. Nos aseguramos que no hay valores nulos
print(tiempo_visualizacion.isnull().sum()) #Resultado = 0
print("--------------------------------")
# sample_7 = tiempo_visualizacion.sample(n=7)
# print(sample_7) #Muestra aleatoria de 7 elementos

# datos_7 = [0.16, 0.01, 0.07, 0.28, 0.07, 0.05, 0.12]
# print(type(datos_7)) #Verificamos el tipo de datos
# datos_7.sort() #Ordenamos los datos de menor a mayor
# print(datos_7)
# print(sum(datos_7)) #Verificamos la suma de los datos
# print(len(datos_7)) #Verificamos el número de elementos
# promedio_7 = sum(datos_7) / len(datos_7) #Calculamos el promedio
# print(promedio_7) #Imprimimos el promedio



#MUESTRA n = 10 

# sample_10 = tiempo_visualizacion.sample(n=10)
# print(sample_10) #Muestra aleatoria de 10 elementos


#3. Análisis con Datos Agrupados n = 5000 
maximo = max(tiempo_visualizacion)
minimo = min(tiempo_visualizacion)
print("Valor máximo:", maximo)
print("Valor mínimo:", minimo)

#Intervalos de clase
intervalos = [0, 11, 22, 33, 44, 55, 66, 77, 88, 99]

frecuencia_absoluta = pd.cut(
    tiempo_visualizacion,
    bins=intervalos,
    right=False
).value_counts().sort_index()

print(frecuencia_absoluta)