# Logística y satisfacción en Olist

Proyecto integrador del Módulo I del Diplomado Métodos estadísticos y matemáticos para la ciencia de datos (Facultad de Ciencias, UNAM). 

Equipo 1 La Granja No VIP.
* **Corona Rojas Emiliano**
* **Luna Hernández Miguel Angel**
* **Barrientos Bonilla Esmeralda**
* **Marín Montoya Pamela**
* **Rodríguez de Jesús Carlos Francisco**

## Objetivo general

Analizar si el incumplimiento de la fecha estimada de entrega en los pedidos de Olist afecta la calificación que otorgan los clientes, con el fin de identificar el impacto de la logística en la satisfacción.

## Objetivos específicos

1. Medir qué proporción de los pedidos se entrega con retraso respecto a la fecha estimada y describir su comportamiento general.
2. Evaluar la relación entre el retraso en la entrega y la calificación que da el cliente.
3. Explorar si existe asociación entre los meses de mayor volumen de pedidos y una mayor incidencia de retrasos.
4. Analizar cómo se relaciona el tiempo total de entrega con la satisfacción del cliente.

## Preguntas

1. ¿Cómo se relaciona el tiempo de entrega de los pedidos con el nivel de satisfacción de los clientes?
2. ¿Existe una asociación entre los meses de mayor volumen de pedidos y el incremento en los retrasos de entrega?

## Contenido

| Archivo o carpeta | Qué contiene |
|---|---|
| `analisis_logistica_satisfaccion.ipynb` | El análisis completo: datos, limpieza, figuras, interpretaciones y conclusiones |
| `requirements.txt` | Versiones de las bibliotecas usadas |
| `resultados/` | Las 9 figuras que genera el notebook |
| `.vscode/settings.json` | Hace que VS Code use el entorno `.venv` de esta carpeta |

## Cómo correrlo en VS Code

Se necesita Python 3.12, Git y VS Code con las extensiones **Python** y **Jupyter**.

0. Obtener el proyecto clonándolo:

   ```bash
   git clone https://github.com/chaffrey8/DMEMCD_2026/tree/Proyecto/Equipo1_LaGranjaNoVIP
   ```

1. Abrir una terminal en VS Code (*Terminal → New Terminal*) y descargar los datos de Olist dentro de esta carpeta:

   ```bash
   git clone https://github.com/olist/work-at-olist-data.git
   ```

   Para usar exactamente la versión del análisis (opcional): `git -C work-at-olist-data checkout d9e4980`.
   Sin Git, se puede descargar el ZIP desde la página del repositorio (*Code → Download ZIP*) y descomprimirlo aquí con el nombre `work-at-olist-data`.

2. Crear el entorno e instalar las dependencias:

   ```bash
   python -m venv .venv
   ```

   ```bash
   .venv\Scripts\python.exe -m pip install -r requirements.txt
   ```

   En macOS o Linux, el segundo comando es `.venv/bin/python -m pip install -r requirements.txt`.

5. Abrir `analisis_logistica_satisfaccion.ipynb`, elegir el kernel `.venv` (arriba a la derecha) y ejecutar *Restart* y luego *Run All*.

El notebook encuentra los datos solo: busca `work-at-olist-data/datasets` o `data/raw` (con los dos CSV) en esta carpeta y en las superiores, o la ruta de la variable de entorno `OLIST_DATA_DIR`.

## Datos

Se usan dos tablas del conjunto público de Olist ([work-at-olist-data](https://github.com/olist/work-at-olist-data), licencia MIT): `olist_orders_dataset.csv` y `olist_order_reviews_dataset.csv`. Los CSV no se modifican; versión utilizada: commit `d9e4980`.

## Origen de esta versión

Esta versión final une el análisis original del repositorio con la versión del equipo (*Proyecto_Satisfaccion_Olist_Para_Equipo_2026*). De esa versión se incorporaron: el uso de `review_answer_timestamp` para saber cuándo respondió el cliente, la comparación por tramos de 24 horas, el filtro de respuestas posteriores a la entrega como análisis de sensibilidad, la sensibilidad de Spearman a la regla de reseña y al quitar un mes, y varias decisiones de diseño de las figuras.

## Estado

El análisis de las dos preguntas está completo, con ocho decisiones de limpieza documentadas y una sección de conclusiones y limitaciones. Falta el registro de contribuciones.

## Registro de contribuciones del equipo

**Proyecto: Análisis de logística y satisfacción del cliente — Olist**

| Integrante | Contribuciones y responsabilidades |
|---|---|
| **Carlos** | Análisis descriptivo de los tiempos de entrega y satisfacción del cliente. Elaboración de estadísticas descriptivas, análisis de correlaciones y comparación de calificaciones según el desempeño logístico. |
| **Esmeralda** | Preparación del entorno, carga de archivos y exploración inicial de datos. Revisión de llaves, estados de pedidos, fechas y valores faltantes. Documentación del diccionario de variables, tipos de datos y criterios de calidad. |
| **Emiliano** | Análisis de puntualidad de las entregas, cumplimiento de fechas prometidas y relación entre el momento de las encuestas y las calificaciones. Desarrollo de pruebas de sensibilidad e interpretación de resultados. |
| **Miguel Ángel** | Evaluación de la calidad de los datos, cálculo de tiempos de entrega y definición de retrasos. Tratamiento de reseñas, identificación de inconsistencias y validación de los datos preparados para el análisis. |
| **Pamela** | Análisis del volumen mensual de pedidos y retrasos. Evaluación de correlaciones, elaboración de visualizaciones y revisión de los resultados del proyecto. |
| **Todo el equipo** | Selección y definición conjunta de las preguntas de investigación. Identificación y corrección de errores durante el desarrollo del análisis. **Elaboración conjunta del código.** Validación de la reproducibilidad del notebook y correcta ejecución del código. Revisión, discusión e interpretación colaborativa de los resultados obtenidos, así como elaboración conjunta de las conclusiones finales del proyecto. |
