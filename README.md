# Análisis de la Violencia Homicida en América Latina

Este proyecto realiza un análisis exploratorio y estadístico de la violencia homicida, la participación de las armas de fuego y algunas condiciones socioeconómicas y demográficas de distintos países. El trabajo utiliza información internacional y concentra una parte importante del análisis en América Latina y el Caribe durante el periodo 2017–2022.

El análisis está desarrollado en el notebook `ProyectoM1.ipynb`

## Objetivo del proyecto

Explorar los patrones y diferencias de la violencia homicida entre países y regiones, así como analizar posibles asociaciones entre la tenencia civil de armas de fuego, las tasas de homicidio y determinadas variables socioeconómicas y demográficas. El proyecto busca identificar características de los países de América Latina y el Caribe con mayores tasas de homicidio, comparar la participación de las armas de fuego y evaluar si los indicadores económicos y demográficos presentan asociaciones consistentes con los niveles de violencia.

### Preguntas de investigación

1. ¿Qué características comparten los países de América Latina y el Caribe que presentan las mayores tasas de homicidio?
2. ¿Existe una asociación entre la tenencia civil de armas de fuego y las tasas de homicidio con armas de fuego a nivel internacional?
3. ¿Qué regiones presentan una mayor proporción de homicidios cometidos con armas de fuego?
4. ¿Cómo se relacionan las condiciones socioeconómicas, como el ingreso, el desempleo y la desigualdad, con los niveles de violencia homicida?

## Datos utilizados

La fuente de distribución de los datos es el conjunto [Global Gun Violence & Civilian Firearms, disponible en Kaggle](https://www.kaggle.com/datasets/dhananjayk2609/global-gun-violence-and-civilian-firearms). El notebook descarga el conjunto mediante `kagglehub` y carga los siguientes archivos CSV:

| Archivo | Unidad de observación | Uso dentro del proyecto |
|---|---|---|
| `civilian_firearms_2017.csv` | País (`iso3`) | Información de 2017 sobre el número estimado de armas en posesión de civiles, armas registradas y no registradas, y armas por cada 100 habitantes. |
| `country_gun_profile.csv` | País (`iso3`) | Perfil de los países con indicadores de tenencia de armas, homicidios, nivel de ingreso y variables socioeconómicas. Se utiliza, entre otros análisis, para explorar la relación internacional entre tenencia civil de armas y homicidios con arma de fuego. |
| `firearm_homicides_country_year.csv` | País y año (`iso3`, `year`) | Serie temporal de homicidios totales y con arma de fuego, tasas por sexo, indicadores de violencia de pareja y variables socioeconómicas y demográficas. Es la base principal para las comparaciones regionales y el análisis de América Latina y el Caribe. |
| `homicide_long_run_western_europe.csv` | País y año (`iso3`, `year`) | Serie histórica de tasas de homicidio de Europa Occidental. El notebook la descarga y carga, pero no la utiliza en los análisis y visualizaciones posteriores. |

La variable `iso3` se utiliza como identificador común de los países y, en las bases, se complementa con `year` para identificar cada observación país-año.

## Metodología y contenido del análisis

El notebook está organizado en las siguientes etapas:

1. **Comprensión y carga de los datos.** Descarga los archivos desde Kaggle, revisa sus dimensiones, variables, tipos de datos, países incluidos y niveles de observación.
2. **Exploración y estadística descriptiva.** Examina valores faltantes y cobertura de los indicadores por región, país y año. Calcula medidas como media, mediana, desviación estándar, cuantiles, rango intercuartílico, coeficiente de variación y asimetría. También explora matrices de correlación de Pearson.
3. **Calidad, limpieza y transformación.** Comprueba duplicados en las claves de identificación y la consistencia entre armas registradas, no registradas y el total estimado. Delimita una muestra de América Latina y el Caribe para 2017–2022, excluye variables con cobertura limitada o fuera del análisis posterior y revisa distribuciones y posibles valores atípicos mediante diagramas de caja y el criterio de 1.5 veces el rango intercuartílico (IQR). Para cinco variables seleccionadas, completa los valores faltantes con la mediana observada en la muestra regional. Se conserva una copia de los datos sin imputar para poder contrastar el tratamiento.
4. **Visualización y análisis.** Compara tasas de homicidio entre regiones; estudia las diferencias entre países latinoamericanos y sus trayectorias en el tiempo; examina diferencias por sexo; explora la asociación internacional entre tenencia civil de armas y homicidios con arma de fuego; y analiza los diez países con mayores tasas medianas de homicidio mediante distribuciones, tendencias y correlaciones con variables socioeconómicas.
5. **Interpretación y conclusiones.** Resume los hallazgos en relación con las preguntas de investigación y considera las limitaciones de cobertura, selección de muestra e imputación.

## Requisitos

- Python 3.
- Jupyter Notebook o JupyterLab.
- Conexión a internet para descargar el conjunto de datos desde Kaggle mediante `kagglehub`.

Las principales bibliotecas utilizadas son `pandas`, `numpy`, `matplotlib`, `seaborn`, `scipy` y `kagglehub`. Para instalar las dependencias desde una terminal, ejecuta:

```bash
python -m pip install pandas numpy matplotlib seaborn scipy kagglehub jupyter
```

## Cómo reproducir el análisis

1. **Descarga o clona el repositorio** y conserva el archivo `README.md` junto al notebook `ProyectoM1.ipynb`.
2. **Instala las dependencias** con el comando indicado en la sección anterior o utilizando el archivo requeriments.txt.
3. **Abre Jupyter** desde la carpeta del proyecto:

   ```bash
   jupyter lab
   ```

   También puedes utilizar `jupyter notebook`.

4. **Abre `ProyectoM1.ipynb`.** En la primera celda de código se utiliza `kagglehub.dataset_download(...)` para descargar el conjunto de datos. No es necesario colocar manualmente los CSV en la carpeta del proyecto, siempre que la descarga desde Kaggle se complete correctamente.
5. En Jupyter, selecciona **Run All Cells** (o la opción equivalente en tu entorno) para ejecutar las celdas en orden y regenerar tablas, cálculos y gráficas.


## Alcance y consideraciones

- El análisis internacional de tenencia civil de armas utiliza la información de 2017 y las tasas promedio de homicidios con arma de fuego reportadas para 2013–2022 en `country_gun_profile.csv`. El análisis temporal regional se concentra en 2017–2022.
- La disponibilidad de información no es homogénea entre países, regiones, años e indicadores. Un valor faltante no debe interpretarse como cero.
- La imputación por mediana se aplica a cinco variables dentro de la muestra regional seleccionada. Este procedimiento conserva las filas, pero puede modificar la dispersión y las correlaciones; por ello, el notebook conserva también la versión sin imputar.
- Las correlaciones y comparaciones presentadas son exploratorias. No demuestran causalidad ni permiten atribuir la violencia homicida a un único factor.
- El notebook utiliza `homicide_long_run_western_europe.csv` únicamente durante la carga inicial y la revisión de dimensiones; no forma parte de los análisis posteriores que se presentan.


**Fuente de datos:** [Global Gun Violence & Civilian Firearms — Kaggle](https://www.kaggle.com/datasets/dhananjayk2609/global-gun-violence-and-civilian-firearms)
