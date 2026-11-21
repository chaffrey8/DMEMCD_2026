# Laboratorio de clase | Análisis exploratorio y preparación de datos con R

**DMEMCDM 2026 · Módulo I · Facultad de Ciencias, UNAM**  
**Preparado e impartido por:** M. en C. David Chaffrey Moreno Fernández  
**Duración:** 6 horas efectivas (más pausas si se imparte en vivo).  
**Carácter:** material complementario; no cambia requisitos de evaluación ni del proyecto.

## Presentación al grupo

En este laboratorio analizaremos los vuelos registrados en Nueva York durante 2013. Trabajaremos con R y RStudio para pasar de la exploración inicial a la limpieza, el análisis descriptivo y la comunicación gráfica. En cada bloque discutiremos qué problema estadístico resolvemos, qué decisiones tomamos y qué límites tienen nuestras conclusiones.

**Modalidad de trabajo:** explicación breve, demostración en RStudio, ejecución guiada y preguntas de interpretación. Los scripts contienen el código que ejecutaremos en clase. Las actividades y preguntas se resuelven con apoyo del docente.

## Antes de comenzar

1. Instalar R y RStudio Desktop; contar con conexión a internet **solo para instalar paquetes**.
2. Descomprimir **todo** el ZIP en una carpeta local con permisos de escritura.
3. Abrir `Laboratorio_R_NYCFlights.Rproj` en RStudio (no abrir solo los scripts).
4. En la consola ejecutar una vez:

```r
install.packages(c("dplyr", "tidyr", "ggplot2", "readr", "tibble", "stringr", "purrr", "nycflights13"))
```

5. Abrir `scripts/00_configuracion.R` y ejecutar con **Source** o línea a línea con **Ctrl+Enter** (en macOS, Cmd+Enter).
6. Ejecutar en orden `01_` a `06_`. Cada archivo carga su configuración, por lo que puede ejecutarse independientemente desde el proyecto.
7. Revisar `resultados/tablas/` y `resultados/figuras/` para los archivos generados.

**No se necesita Quarto, R Markdown, LaTeX ni Python.** Los datos reales vienen dentro del paquete `nycflights13`, no se descargan manualmente. `datos/datos_alterados_didacticos.csv` es una **simulación alterada**, no una muestra fiel del conjunto original.

## Nuestra ruta de trabajo

| Bloque | Tiempo | Archivo | Evidencia |
|---|---:|---|---|
| 1. Primer contacto y exploración | 60 min | `01_exploracion.R` | diagnóstico y CSV de muestra |
| 2. Manipulación y uniones | 60 min | `02_manipulacion.R` | resumen por aerolínea |
| 3. Estadística descriptiva | 60 min | `03_estadistica.R` | indicadores y correlaciones |
| 4. Calidad y transformación | 60 min | `04_limpieza.R` | auditoría y sensibilidad |
| 5. Visualización | 60 min | `05_visualizacion.R` | siete figuras PNG |
| 6. Programación e integración | 60 min | `06_integracion.R` | resumen mensual y registro |

La distribución es una guía, no un cronómetro. Se recomiendan dos pausas de 10 minutos **adicionales**.

## Criterios metodológicos

- Una fila de `flights` representa un registro de vuelo, no una persona ni una aerolínea.
- Los retrasos negativos representan adelantos; `NA` no equivale a cero.
- Las comparaciones entre aerolíneas son **descriptivas**, no ajustes por rutas ni inferencias causales.
- Los extremos IQR se identifican, pero no se borran automáticamente.
- Antes de cada unión se revisa la unicidad de las llaves y la conservación de filas.
- Los resultados se calculan al ejecutar los scripts: **no se proporcionan cifras no verificadas**.

## Documentos

`documentos/Guia_RStudio.md` (instalación y solución de problemas), `Guion_Docente.md`, `Notas_Docentes.md`, `Actividades_Estudiantes.md`, `Solucionario_Docente.R`, `Equivalencias_Python_R.md`, `Evaluacion_Formativa.md` y `Referencias.md`.

## Fuentes

`nycflights13` (datos y documentación): https://cran.r-project.org/package=nycflights13  
R for Data Science, 2ª ed.: https://r4ds.hadley.nz/  
Documentación R: https://cran.r-project.org/manuals.html

## Comprobación del trabajo realizado

Ejecutar `scripts/99_verificacion.R` **después** de los seis bloques para comprobar que se generaron las salidas y que las tablas tienen consistencia básica.
