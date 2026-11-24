# Proyecto Equipo 9: Análisis de Airbnb en CDMX

Realizamos un análisis exploratorio de la oferta de alojamientos de Airbnb en la Ciudad de México.

# 1. Comprensión de los datos

## 1.1 Fuente de información

Para el desarrollo de este proyecto se utilizará información pública de **Inside Airbnb**, una iniciativa independiente que recopila y proporciona datos relacionados con los alojamientos publicados en la plataforma Airbnb en distintas ciudades del mundo.

El conjunto de datos seleccionado corresponde a la **Ciudad de México, México**, y fue obtenido del portal oficial de Inside Airbnb, específicamente del archivo *Detailed Listings* (`listings.csv`).

**Fuente de información:** [Inside Airbnb – Get the Data](https://insideairbnb.com/es/get-the-data/)

El archivo contiene información detallada sobre los alojamientos registrados en la plataforma, incluyendo características de las propiedades, ubicación geográfica, precios, disponibilidad, información de los anfitriones y evaluaciones de los huéspedes.

Los datos se encuentran en formato CSV (*Comma-Separated Values*) y fueron alojados en el repositorio de GitHub del equipo para facilitar su acceso y permitir la reproducción del análisis.

## 1.2 Descripción general del conjunto de datos

El conjunto de datos seleccionado contiene **30,468 observaciones y 90 variables**, correspondientes a los alojamientos publicados en Airbnb para la Ciudad de México.

Cada registro contiene información asociada a un alojamiento, mientras que las columnas representan diferentes características relacionadas con su identificación, ubicación, tipo de propiedad, capacidad, precios, disponibilidad, anfitriones y evaluaciones de los huéspedes.

La amplitud de variables disponibles permite abordar el estudio desde distintas perspectivas, particularmente en aspectos geográficos, económicos y descriptivos de la oferta de alojamientos.

Esta estructura proporciona información suficiente para explorar las características de los anuncios y realizar comparaciones entre distintas zonas y categorías de alojamiento.

## 1.3 Unidad de observación y contexto

La unidad de observación de este conjunto de datos es **cada alojamiento publicado en Airbnb**. Por lo tanto, cada fila representa un anuncio individual y cada columna contiene información relacionada con sus características particulares.

La información permite observar distintos aspectos de la oferta de alojamientos en la Ciudad de México, desde su ubicación y características físicas hasta sus precios, disponibilidad y relación con los anfitriones que los administran.

Es importante considerar que el conjunto de datos representa una recopilación de anuncios disponibles en un periodo determinado, por lo que constituye una fotografía de la oferta registrada y no un seguimiento histórico de todos los alojamientos de la plataforma.

Asimismo, la información corresponde a los anuncios incluidos en la recopilación de Inside Airbnb y no necesariamente representa la totalidad de los alojamientos existentes en la ciudad.

## 1.4 Variables disponibles

El conjunto de datos contiene 90 variables que describen diferentes características de los alojamientos y sus respectivos anfitriones. De acuerdo con el diccionario de datos de Inside Airbnb, disponible también en este repositorio con el nombre (`dict.pdf`), estas variables pueden organizarse en las siguientes categorías:

- **Identificación del alojamiento:** incluye identificadores únicos de los anuncios, como `id`, así como información descriptiva del anuncio.
- **Información del anfitrión:** contiene datos relacionados con los anfitriones, como su identificador (`host_id`), antigüedad en la plataforma, verificaciones y cantidad de alojamientos administrados.
- **Ubicación geográfica:** comprende información sobre la localización de los anuncios, incluyendo alcaldías (`neighbourhood_cleansed`) y coordenadas geográficas (`latitude` y `longitude`).
- **Características de los alojamientos:** describe el tipo de propiedad (`property_type`), tipo de habitación (`room_type`), capacidad de huéspedes (`accommodates`), número de habitaciones y camas.
- **Información económica:** incluye el precio por noche (`price`) y otras variables relacionadas con las cotizaciones y restricciones de estancia.
- **Disponibilidad:** contiene indicadores sobre la disponibilidad de los alojamientos para distintos horizontes de tiempo, como `availability_30`, `availability_90` y `availability_365`.
- **Reseñas y calificaciones:** incorpora el número de evaluaciones recibidas (`number_of_reviews`), la frecuencia de reseñas y las puntuaciones otorgadas por los huéspedes, como `review_scores_rating`.

Esta diversidad de información permite estudiar la oferta de alojamientos desde distintas perspectivas y realizar comparaciones entre zonas geográficas, tipos de propiedad y características de los anfitriones.

# 2. Estructura del repositorio

El repositorio cuenta con una estructura sencilla y centralizada, diseñada para facilitar la consulta, ejecución y reproducción del análisis.

| Archivo | Descripción |
|---|---|
| `main.ipynb` | Notebook principal que contiene el desarrollo del proyecto, incluyendo la exploración, limpieza, procesamiento, análisis y visualización de los datos. |
| `dict.pdf` | Diccionario completo de la base de datos utilizada. |
| `requirements.txt` | Archivo que especifica las librerías y versiones necesarias para ejecutar el proyecto. |
| `README.md` | Documento que presenta el proyecto, sus objetivos, metodología e integrantes. |

El conjunto de datos utilizado para el desarrollo del proyecto se encuentra disponible en la sección *Releases* del repositorio.

# 3. Instrucciones de ejecución

En la primer línea de `main.ipynb` ejecuta la línea de código:

`%pip install -r requirements.txt`

Esto descarga las paqueterías necesarias para el resto del análisis. Posteriormente se importan las paqueterías. 

La base de datos se obtiene en el bloque: 
```
url = (
    "https://github.com/serpennskill/"
    "Proyecto_equipo_9/releases/download/"
    "Dataset/listings.csv")
# Configurar formato de visualización de números
pd.options.display.float_format = '{:,.2f}'.format
df = pd.read_csv(url, low_memory=False)
```
Es decir, directamente del repositorio, por lo que no es necesario tenerla descargada previamente. 

A partir de esto, se puede continuar con el resto del código. 

# 4. Integrantes

Los miembros del equipo son: 
- García Varela José Antonio
- Jiménez Chávez Vanessa Guadalupe 
- Navarro Castillo Rafael Alberto
- Rodríguez Hernández Fernanda
- Sandoval Fernandez Dante