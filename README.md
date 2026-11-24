# Siniestros viales en Gran Bretaña (STATS19)

**Proyecto integrador — Módulo I**
Diplomado en Métodos Estadísticos y Matemáticos para la Ciencia de Datos, Ed. 3 (Facultad de Ciencias, UNAM)
Módulo I: Preprocesamiento y técnicas básicas de visualización de datos
Fecha de entrega: 24 de noviembre de 2026

## Equipo

- Guillermo Adolfo Méndez Roche
- Sofía Quetzalli González Robles
- Karla Melanie Camberos Jiménez
- Tamara Iraís Lara Sandoval
- Juan Carlos Lee Martinez Cairo

El registro de lo que aportó cada integrante está en [`CONTRIBUCIONES.md`](CONTRIBUCIONES.md).

## Objetivo

Realizar un análisis exploratorio y descriptivo de la base de datos oficial de siniestros viales
STATS19 (años 2023, 2024 y 2025), documentando los problemas de calidad de los datos, las
decisiones de limpieza y transformación, y comunicando los hallazgos con visualizaciones e
interpretaciones.

El análisis parte de una pregunta general:

> En siniestros con exactamente dos automóviles y conductores de distinto sexo, ¿cómo se
> comparan la presencia y la gravedad de las lesiones registradas de ambos conductores ?

que se concreta en dos preguntas de investigación de carácter descriptivo:

1. Si solo uno de los conductores presenta lesiones registradas, ¿existe una tendencia
   consistente sobre si se trata del conductor o de la conductora?
2. Si ambos conductores presentan lesiones registradas de distinta gravedad, ¿existe una
   tendencia sobre cuál de los dos presenta las lesiones más graves?

**Población de estudio.** Siniestros de exactamente dos vehículos, ambos automóviles
(`vehicle_type == 9`), con un conductor hombre y una conductora mujer, y con impacto frontal
(`first_point_of_impact == 1`) en ambos vehículos. La unidad de análisis es el par de
conductores de un mismo siniestro.


## Datos y licencia

Los datos provienen de STATS19 (Road Safety Data), publicados por el Department for Transport
(DfT) del Reino Unido:
<https://www.gov.uk/government/statistical-data-sets/road-safety-open-data>
(consultado el 21 de noviembre de 2026). Se usan los años 2023, 2024 y 2025, con tres tablas por
año: `collisions` (siniestros), `vehicles` (vehículos) y `casualties` (víctimas).

Contains public sector information licensed under the Open Government Licence v3.0.
Licencia: <https://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/>

Los CSV de la carpeta `Datos/` son los publicados por el DfT, sin modificaciones, junto con la
guía oficial de datos (`dft-road-casualty-statistics-road-safety-open-dataset-data-guide-2025.xlsx`),
que describe cada variable y sus códigos. El análisis, las transformaciones y las conclusiones son
del equipo y no representan al DfT.

Nota importante sobre la fuente: STATS19 solo registra siniestros ocurridos en la vía pública,
con al menos una persona lesionada o fallecida y que llegaron a conocimiento de la policía en un
plazo máximo de 30 días. El DfT advierte además un subregistro de lesiones no mortales, por lo que
la ausencia de una lesión registrada no implica que la persona haya resultado ilesa.

## Cómo reproducir el análisis

### Requisitos

- Python 3.12 o superior
- Git

### Pasos

1. Clonar la rama del equipo:

   ```bash
   git clone https://github.com/chaffrey8/DMEMCD_2026.git --branch proyecto/CarritosChocones --single-branch CarritosChocones
   cd CarritosChocones
   ```

2. Crear un entorno virtual e instalar las dependencias:

   ```bash
   python -m venv .venv
   source .venv/bin/activate        # En Windows: .venv\Scripts\activate
   pip install -r requirements.txt
   ```

3. Abrir el notebook **desde la carpeta `Notebooks/`**:

   ```bash
   cd Notebooks
   jupyter notebook Proyecto_CarritosChocones_v2.ipynb
   ```

   El notebook lee los datos con la ruta relativa `../Datos`, por lo que debe ejecutarse con
   `Notebooks/` como directorio de trabajo. Los datos ya vienen incluidos en el repositorio, no
   hace falta descargar nada.

4. Ejecutar **todas las celdas en orden** (*Kernel → Restart & Run All*). Algunas celdas
   modifican las tablas en memoria, así que si se vuelve a ejecutar una celda suelta conviene
   reiniciar el kernel y correr el notebook completo desde el principio.

5. Las figuras y tablas se guardan en `Notebooks/resultados/`.


## Dependencias

Todas las librerías están listadas en [`requirements.txt`](requirements.txt). El análisis usa
principalmente `pandas`, `numpy` y `matplotlib`, además de Jupyter para ejecutar el notebook.

## Contenido del notebook

1. **Introducción:** descripción de STATS19, sus tablas, identificadores y preguntas conductoras.
2. **Carga y exploración inicial de datos:**
   - Carga de las nueve tablas.
   - Verificación de identificadores y consistencia entre tablas.
   - Exploración de las variables de sexo y gravedad de las lesiones.
3. **Construcción de la población de estudio:** criterios de selección, filtrado de los datos y construcción del diccionario `análisis`.
4. **Análisis de las lesiones registradas en cada pareja:** respuesta a las dos preguntas conductoras.
5. **Extensión del análisis: relación entre la cilindrada y las lesiones registradas:** limpieza de la variable `engine_capacity_cc` y análisis por diferencias de cilindrada.
6. **Extensión del análisis: diferencia de edad dentro de la pareja:** limpieza de la variable `age_of_driver` y análisis por diferencias de edad.
7. **Conclusiones:** principales resultados, limitaciones y posibles líneas de investigación futuras.

## Limitaciones

- Es un análisis exploratorio y descriptivo: una asociación observada no implica causalidad.
- STATS19 no registra la masa de los vehículos, la velocidad de impacto ni el uso del cinturón,
  variables que podrían explicar parte de las diferencias observadas.
- Hay subregistro de lesiones no mortales y entre el 13 % y el 14 % de los conductores no tiene
  sexo conocido; esos registros se excluyen de la población de estudio.
- Los resultados aplican solo a la población delimitada y no pueden generalizarse a todos los
  siniestros viales.

