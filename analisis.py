import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns


#1. Cargar el archivo

df = pd.read_csv('netflix_customer_churn.csv')

#2 Visualizar filas y columnas

print("\n ----DIMENSIONES DE LA BASE DE DATOS-----\nAnálisis de la tasa de abandono y el nivel de compromiso de los clientes de Netflix")

filas, columnas = df.shape

print(f"\nTotal de las filas (REGISTROS): {filas}")
print(f"Total de las columnas (VARIABLES): {columnas}")


print("-------------------")

print("----PRIMER VISTAZO-----\n")
print(df.head())


#3. Resumen técnico de las varibales
print("\n-----RESUMEN VARIABLES-----")
df.info()
