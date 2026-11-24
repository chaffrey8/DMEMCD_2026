# Contribuciones del equipo

Proyecto integrador.
Módulo I 

---

## Guillermo Adolfo Méndez Roche

### Planteamiento y diseño metodológico
- Evaluación y selección de STATS19 como base de datos para el proyecto.
- Definición de la población de análisis y de sus criterios de selección.
- Formulación de las dos preguntas conductoras.
- Diseño de la metodología de comparación por pares de conductores pertenecientes a un mismo siniestro.

### Análisis y limpieza
- Diseño e implementación de una estructura de diccionarios anidados (`datos[año]["nombre_de_la_tabla"]`) para organizar y acceder de manera uniforme a las tres tablas de cada año (sección 2.1).
- Verificación de la unicidad de los identificadores y de la consistencia del número de vehículos registrados entre tablas (secciones 2.4.1 y 2.4.2).
- Exploración de las variables relativas al sexo de los conductores y a la gravedad de las lesiones (sección 2.4.3).
- Diseño e implementación del proceso de filtrado mediante identificadores y construcción del diccionario `análisis` (secciones 3.1 a 3.4).
- Incorporación de la información sobre lesiones registradas y su gravedad a la tabla `vehicles`, incluyendo la creación de la variable `lesión_registrada` (sección 4.1).
- Desarrollo de los procedimientos de cálculo para responder las dos preguntas conductoras (secciones 4.2 y 4.3.1).

### Visualización y reproducibilidad
- Diseño y desarrollo de las visualizaciones originales para las dos preguntas conductoras, antes de la homogeneización (secciones 4.2.1 y 4.3.2).

### Redacción y documentación del cuaderno
- Redacción de los borradores iniciales del cuaderno, incluyendo el planteamiento del problema y la explicación de la metodología.
- Identificación y discusión de las limitaciones metodológicas del análisis.
- Redacción e interpretación de los resultados de las dos preguntas conductoras (secciones 4.2.2 y 4.3.3).

### Presentación
- Turno de exposición: presentación del equipo, descripción de STATS19, estructura relacional de sus tres tablas, definición de la población de análisis y planteamiento de las preguntas conductoras del proyecto (diapositivas 1 a 5).

---

## Juan Carlos Lee Martinez Cairo

### Análisis y limpieza
- Seccion donde se analizan los incidentes por edad. Seccion 6. 
- Inclusiones de tablas explicativas de variables.

### Redacción y documentación del cuaderno
- Homogenizacion de formato y funciones relacionadas
- Revisión del lenguaje .
- Citas formales.

### Visualización y reproducibilidad
- Unificación del estilo de las seis figuras: tamaño, paleta Okabe-Ito (azul `#0072B2` y bermellón `#D55E00`), títulos, ejes e intervalos de Wilson al 95 %.
- Estilo de tablas legible en modo claro y oscuro.
- Verificación de que el cuaderno se ejecuta de principio a fin en una copia limpia del repositorio, sin errores.
- `requirements.txt` con las versiones usadas y sección nueva del `README.md`.

### Presentación
- Turno de exposición: auditoría de calidad de los datos y embudo de selección (diapositivas 6 y 7 de la presentación).

---

## Karla Melanie Camberos Jiménez

### Análisis y limpieza
- Análisis descriptivo de las dos preguntas conductoras principales del proyecto.
- Cálculo de porcentajes anuales y globales de lesiones únicas y diferencias de gravedad.
- Delimitación de los criterios de selección de las parejas para cada análisis.

### Redacción y documentación del cuaderno
- Documentación de los resultados obtenidos para ambas preguntas conductoras.
- Explicación de los supuestos y limitaciones de interpretación de las variables analizadas.
- Incorporación de precisiones sobre el subregistro y el alcance descriptivo del análisis.

### Visualización y reproducibilidad
- Elaboración de las Figuras 1 y 2 para visualizar los porcentajes de lesiones únicas y diferencias de gravedad.
- Incorporación de intervalos de confianza de Wilson al 95 % y referencia del 50 %.

### Presentación
- Turno de exposición: Explicación de los resultados obtenidos en las dos preguntas conductoras principales y transición hacia las extensiones del análisis (diapositivas 8 y 9 de la presentación).

---

## Tamara Iraís Lara Sandoval

### Análisis y limpieza
- Incorporación de la variable engine_capacity como extensión del análisis.
- Identificación y tratamiento de valores faltantes, exclusiones y valores fuera del rango establecido.
- Cálculo de diferencias de cilindrada dentro de cada pareja, análisis e interpretación según quién resultó lesionado.

### Redacción y documentación del cuaderno
- Documentación de la metodología utilizada para el análisis de cilindrada.
- Incorporación de explicaciones sobre las decisiones de limpieza y selección de la variable.

### Visualización y reproducibilidad
- Elaboración e inclusión de tablas explicativas de la variable.
- Interpretación de las gráficas correspondientes a la distribución de las diferencias de cilindrada y la ventaja de motor.
- Presentación de resultados mediante tablas descriptivas y gráficas comparativas.

### Presentación
- Turno de exposición: explicación de la nueva variable tomada para el análisis, las decisiones de limpieza, así como los resultados que obtuvimos (diapositivas 10 a 12 de la presentación).

--- 

## Sofía Quetzalli González Robles

### Análisis y limpieza
- Análisis de la variable edad dentro de la pareja, mediante el cálculo de Δedad.
- Auditoría de valores faltantes y revisión de casos atípicos.
- Análisis de sensibilidad al registro de edad atípico de 4 años y verificación de consistencia de la información.

### Redacción y documentación del cuaderno
- Documentación de la extensión emparejada de edad y sus resultados.
- Elaboración de la síntesis crítica final del proyecto, incluyendo alcances, limitaciones y líneas futuras de análisis.

### Visualización y reproducibilidad
- Elaboración e interpretación correspondientes al análisis de edad y sus estratos.
- Análisis de sensibilidad utilizando cortes de 5, 10 y 15 años.
- Organización y explicación de la estructuración del repositorio en GitHub para facilitar la reproducibilidad del proyecto.

### Presentación
- Turno de exposición: explicación de la extensión emparejada de edad, análisis por estratos, organización del repositorio, reproducibilidad y conclusiones finales del proyecto (diapositivas 13 a 15 de la presentación).
