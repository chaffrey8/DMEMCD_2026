&nbsp;

# Precios de Airbnb y ubicación en la Ciudad de México - Estatus del Proyecto (TERMINADO)

**Análisis exploratorio reproducible de 27,820 alojamientos anunciados en Airbnb**

Proyecto Integrador del Módulo I · *Preprocesamiento y técnicas básicas de visualización de datos* Diplomado en Métodos Estadísticos y Matemáticos para la Ciencia de Datos (DMEMCD) · 2026

|  |  |
| :---- | :---- |
| **Equipo** | Gentrificadores |
| **Video de exposición** | https://drive.google.com/file/d/1z6ks1jpa9J0ymz2kbfBM0VuqEMQFe-PT/view |
| **Visualizador del Proyecto** | https://eulisseymontes-rqm.github.io/airbnb-cdmx-visualizador/ |

---

## Contenido

1. [Objetivo y preguntas de investigación](#1-objetivo-y-preguntas-de-investigación)  
2. [Datos](#2-datos)  
3. [Estructura del repositorio](#3-estructura-del-repositorio)  
4. [Contenido del notebook](#4-contenido-del-notebook)  
5. [Calidad, limpieza y transformación](#5-calidad-limpieza-y-transformación)  
6. [Principales hallazgos](#6-principales-hallazgos)  
7. [Cómo reproducir el análisis](#7-cómo-reproducir-el-análisis)   
8. [Referencias y créditos](#11-referencias-y-créditos)

---

## 1\. Objetivo y preguntas de investigación

El proyecto realiza un **análisis exploratorio de datos (EDA)** sobre los anuncios de Airbnb en la Ciudad de México para estudiar cómo se distribuye el precio anunciado por noche y cómo se relaciona con la ubicación de los alojamientos, considerando también características del alojamiento y del anfitrión.

El análisis es **descriptivo**: busca identificar patrones y diferencias entre grupos. No establece relaciones causales ni construye modelos predictivos.

**Pregunta general**

> ¿Cómo se relaciona la ubicación geográfica de los alojamientos de Airbnb en la Ciudad de México con sus precios anunciados, y cómo varía esta relación según las características del alojamiento y del anfitrión?

**Preguntas específicas** (cada una se responde en una sección del notebook)

| \# | Pregunta | Sección |
| :---- | :---- | :---- |
| 1 | ¿Cómo se distribuye el precio anunciado por noche y cómo difiere entre tipos de alojamiento por alcaldía? | 4.1 |
| 2 | ¿Cómo se relaciona la distancia de los alojamientos al centro de la ciudad con sus precios anunciados? | 4.2 |
| 3 | ¿Qué tanto se relaciona el precio con las características del alojamiento: modalidad, capacidad y número de recámaras? | 4.3 |
| 4 | ¿Existe una asociación entre el precio de un alojamiento y su calificación general? | 4.4 |
| 5 | ¿Los anfitriones comerciales (con 10 o más anuncios) cobran distinto que los particulares dentro de una misma alcaldía y tipo de alojamiento? | 4.5 |

## 2\. Datos

### Procedencia y condiciones de uso

Los datos provienen de [Inside Airbnb](https://insideairbnb.com/get-the-data/), un proyecto independiente que recopila periódicamente información pública de los anuncios de Airbnb en distintas ciudades. Se usa la captura de la **Ciudad de México del 23 de septiembre de 2026**.

Inside Airbnb publica sus datos bajo la licencia **Creative Commons Attribution 4.0 (CC BY 4.0)**, que permite usarlos citando la fuente.

### Archivos y unidad de observación

| Archivo | Contenido | Unidad de observación | Tamaño |
| :---- | :---- | :---- | :---- |
| `listings` | Características de cada anuncio: ubicación, tipo, capacidad, precio, reseñas y anfitrión | Un anuncio (alojamiento publicado) | 30,468 filas, 90 columnas |
| `calendar` | Disponibilidad de cada anuncio durante los siguientes 365 días | Un anuncio en una fecha | 11,120,831 filas |
| `reviews` | Reseñas publicadas por los huéspedes | Una reseña | 1,795,294 filas |

En este proyecto, un **anuncio** es un alojamiento publicado en Airbnb; no se trata de publicidad.

El análisis de precios se hace sobre `listings` (26 de sus 90 columnas, descritas en el diccionario de datos de la sección 1.3 del notebook). `calendar` y `reviews` se exploran en la sección 1 para entender el contexto de los datos.

### Base final de análisis

Después de la limpieza, la base de análisis tiene **27,820 anuncios**, el 91.3 % de los 30,468 del archivo original. Corresponden a la **oferta activa** de la captura (anuncios con precio creíble).

## 3\. Estructura del repositorio

```
.
├── .gitignore
├── requirements.txt
├── Proyecto_Modulo1_DMEMCD.ipynb   
├── README.md
├── CONTRIBUTIONS.md
└── datos/                          
```
Los datos **no se incluyen** en el repositorio por su tamaño y para respetar las condiciones de acceso de Inside Airbnb.

## 4\. Contenido del notebook

| Sección | Descripción |
| :---- | :---- |
| Introducción | Planteamiento del problema, procedencia de los datos, objetivo y preguntas de investigación |
| **0\. Preparación del entorno** | Librerías, estilo de las gráficas, carpeta de resultados y descarga de los datos |
| **1\. Comprensión de los datos** | Primer vistazo a `listings`, `calendar` y `reviews`; diccionario de datos; base de análisis |
| **2\. Exploración y estadística descriptiva** | Tipos de dato, variables numéricas y categóricas, análisis del precio y análisis bivariado |
| **3\. Calidad, limpieza y transformación** | Duplicados, faltantes, reglas de consistencia, valores atípicos y las siete decisiones documentadas |
| **4\. Visualización y respuesta a las preguntas** | Una subsección por pregunta (4.1 a 4.5), cada una con sus gráficas, interpretación y respuesta |
| **5\. Interpretación y conclusiones** | Hallazgos, qué se puede y qué no afirmar, consideraciones y líneas futuras |
| Referencias | Fuentes de datos y literatura consultada |

## 5\. Calidad, limpieza y transformación

Cada decisión del notebook documenta el problema detectado, lo que se hizo y su consecuencia.

| \# | Decisión | Problema | Qué se hizo y consecuencia |
| :---- | :---- | :---- | :---- |
| 1 | Convertir el precio a número | `price` venía como texto (`$3,505.00`) | Se quitaron `$` y comas y se verificó que ningún texto quedará sin convertir ni hubiera precios menores o iguales a cero |
| 2 | Tratar faltantes según su origen | El 82 % de los anuncios sin precio proviene de capturas anteriores (anuncios que ya no operan); los faltantes de reseñas son estructurales (anuncios sin reseñas) | Se analiza solo la oferta de la captura actual y se eliminan los 380 anuncios sin precio. **El precio no se imputa**, porque asignarle la mediana inventaría el dato de la variable de estudio. Las variables de reseñas se dejan como faltantes |
| 3 | Excluir precios no creíbles | Precios imposibles para el tamaño del alojamiento (por ejemplo, una recámara para una persona a un millón de pesos por noche) | Regla de Tukey con 3·IQR sobre el logaritmo del precio por huésped. Se excluyen 84 anuncios (0.3 %): la desviación estándar baja de \$9,026 a \$2,897 y la mediana casi no cambia (de \$1,503 a \$1,500) |
| 4 | Analizar el precio en escala logarítmica | Asimetría de 11.97 en escala original | Con `log10(precio)` la asimetría baja a 0.45. Los resúmenes se reportan en pesos, con mediana y cuartiles |
| 5 | Acotar `maximum_nights` | Valor máximo de 2,147,483,647 (límite de un entero de 32 bits), que indica ausencia de límite | Tope de 1,125 noches (límite de Airbnb) y variable indicadora `sin_limite_noches` creada antes de acotar |
| 6 | Anular `bedrooms` y `beds` incoherentes | Valores de 50 y razones de camas por recámara poco creíbles | 35 casos (de 27,820) se convierten a nulo y se marcan con `bedrooms_beds_corregido` |
| 7 | Agrupar categorías raras de `property_type` | 86 niveles, 75 de ellos con menos del 1 % de los registros | Se agrupan en `Other` (de 86 a 12 niveles, 2,307 registros) y se conserva la variable original |

Un valor atípico no siempre es un error y no todo faltante debe imputarse: por eso los precios altos pero plausibles se conservan, y los faltantes se tratan según su origen.

## 6\. Principales hallazgos

Trabajamos con 27,820 anuncios activos de la captura del 23 de septiembre de 2026\.

1. **Distribución y tipo de alojamiento (4.1).** El precio se concentra en valores bajos con una cola de anuncios muy caros, y el tipo de alojamiento es la diferencia más clara. Por alcaldía, en las 16 el alojamiento completo es más caro que la habitación privada. Las alcaldías del centro y poniente son las más caras, y también las que concentran la oferta. Las de la periferia son más baratas y con menos anuncios. Ademas, la ubicación pesa más en los alojamientos completos que en las habitaciones.
2. **Distancia al centro (4.2).** La distancia al Zócalo casi no se relaciona con el precio (ρ \= −0.08). El precio sube del primer cuadro hasta un máximo entre 3 y 7 km y luego baja. Lo que sí marca diferencia es la dirección: el poniente tiene una mediana 53.7 % mayor que el oriente.  
3. **Características del alojamiento (4.3).** El precio total crece con la capacidad (de \$1,500 para dos huéspedes a \$3,408 para ocho), pero el precio por huésped baja de \$750 a alrededor de \$400. Recámaras (0.46) y capacidad (0.43) tienen una correlación moderada con el precio.  
4. **Calificación (4.4).** La asociación entre precio y calificación es positiva pero débil (Spearman de 0.15) y crece con más reseñas (0.25 con 92 reseñas o más). No se repite en todas las alcaldías: en Álvaro Obregón no hay asociación.  
5. **Tipo de anfitrión (4.5).** Los anfitriones comerciales (10 anuncios o más) cobran 21 % más en mediana, pero dentro de la misma alcaldía y modalidad la diferencia baja a cerca de 10 %, porque los comerciales se concentran en Cuauhtémoc y Miguel Hidalgo.

**En conjunto:** la ubicación sí se asocia con el precio, pero no a través de la distancia al centro sino de la **zona**: las alcaldías centrales y del poniente son más caras. La modalidad y el tamaño del alojamiento pesan tanto como la ubicación, y el tipo de anfitrión añade una diferencia menor.

### Qué podemos afirmar y qué no

- **Sí:** existen diferencias sistemáticas en el precio anunciado entre zonas, tipos de alojamiento, tamaños y tipos de anfitrión, y varias se mantienen al comparar grupos más parecidos.  
- **No:** que la ubicación, el tamaño, la calificación o el tipo de anfitrión *causen* esas diferencias. Es un análisis descriptivo de datos observacionales y puede haber variables que no medimos (calidad del inmueble, amenidades, colonia exacta).

### Limitaciones

- **Precio publicado, no pagado:** es la tarifa vigente en la fecha de la captura; no refleja descuentos, temporadas ni el precio final.  
- **Una sola fecha:** los resultados describen la oferta de septiembre de 2026\.  
- **Oferta activa:** se excluyen los anuncios de capturas anteriores y los anuncios sin precio.  
- **Ubicación aproximada:** Inside Airbnb desplaza las coordenadas hasta 150 m, y la alcaldía es una unidad grande que mezcla colonias muy distintas.  
- **Umbrales elegidos por el equipo:** 3·IQR para precios no creíbles, el 1 % para agrupar tipos de propiedad y los mínimos de anuncios por grupo; otros umbrales moverían ligeramente los números.  
- **Calificaciones concentradas:** la mitad de los anuncios tiene 4.84 o más, lo que limita su capacidad para distinguir alojamientos.  
- **Anfitrión comercial:** no existe un umbral estándar; se usa 10 anuncios, siguiendo a Ke (2017).

## 7\. Cómo reproducir el análisis

### Requisitos

- Python 3.10 o superior  
- Conexión a internet  
- Espacio en disco y memoria suficientes.

### Pasos

```sh
# 1. Clonar el repositorio
git clone https://github.com/chaffrey8/DMEMCD_2026/tree/proyecto/gentrificadores
cd proyecto/gentrificadores

# 2. (Opcional) Crear un entorno virtual

# 3. Instalar las dependencias
pip install -r requirements.txt

# 4. Abrir el notebook
jupyter notebook Proyecto_Modulo1_DMEMCD.ipynb
```

Ejecutar el notebook desde la raíz del repositorio. Al correr la sección *0.3. Carga de los datos*, los archivos de la captura `2026-09-23` se descargan automáticamente en `datos/` (solo si todavía no existen).

También puede ejecutarse en **Google Colab**: basta con subir el notebook; la descarga de datos funciona igual.

### Obtención manual de los datos

Si la descarga automática falla (por ejemplo, porque Inside Airbnb retiró la captura o cambió la URL), descarguen los archivos de la Ciudad de México desde [insideairbnb.com/get-the-data](https://insideairbnb.com/get-the-data/) y guárdenlos en `datos/` con estos nombres:

```
datos/mexico-city-listings-2026-09-23.csv.gz
datos/mexico-city-calendar-2026-09-23.csv.gz
datos/mexico-city-reviews-2026-09-23.csv.gz
```


## 8\. Referencias y créditos

- Inside Airbnb. *Get the Data: Mexico City, 23 September 2026*. [https\://insideairbnb.com/get-the-data/](https://insideairbnb.com/get-the-data/) (licencia CC BY 4.0).  
- Inside Airbnb. *Data Dictionary*. [https\://insideairbnb.com/data-assumptions/](https://insideairbnb.com/data-assumptions/)  
- INEGI. *Aspectos geográficos de la Ciudad de México*. [https\://inegi.org.mx](https://inegi.org.mx)  
- Rentals United. *Step 5: Price and availability*. [https\://docs.rentalsunited.com/hc/en-gb/articles/34003672254109-Step-5-Price-and-availability](https://docs.rentalsunited.com/hc/en-gb/articles/34003672254109-Step-5-Price-and-availability)  
- Tukey, J. W. (1977). *Exploratory Data Analysis*. Addison-Wesley.  
- Ke, Q. (2017). *Sharing Means Renting? An Entire-marketplace Analysis of Airbnb*. arXiv:1701.01645. [https\://arxiv.org/abs/1701.01645](https://arxiv.org/abs/1701.01645)

Este repositorio es un trabajo académico y no está afiliado a Airbnb ni a Inside Airbnb.