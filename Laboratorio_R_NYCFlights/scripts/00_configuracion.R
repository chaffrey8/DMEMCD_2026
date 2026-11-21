# DIPLOMADO | Métodos estadísticos y matemáticos para la ciencia de datos
# MÓDULO I | Preprocesamiento y técnicas básicas de visualización de datos
# Facultad de Ciencias, UNAM | M. en C. David Chaffrey Moreno Fernández
# CLASE GUIADA | NYC Flights 2013 | R + RStudio | 6 horas
# Autor y docente: M. en C. David Chaffrey Moreno Fernández
# Propósito: ejecutar, discutir e interpretar cada sección durante la clase.
# INDICACIONES PARA EL GRUPO:
# 1. Abrimos el archivo .Rproj desde RStudio.
# 2. Ejecutamos líneas con Ctrl+Enter (Cmd+Enter en macOS).
# 3. Antes de ejecutar cada bloque, anticipamos qué resultado esperamos.
# 4. Documentamos las decisiones; no modificamos los datos originales.

# BLOQUE 0 | Preparación (ejecutar primero)
# Instalación SOLO una vez, desde la consola, si falta algún paquete:
# install.packages(c("dplyr", "tidyr", "ggplot2", "readr", "tibble",
#                    "stringr", "purrr", "nycflights13"))
paquetes <- c("dplyr", "tidyr", "ggplot2", "readr", "tibble", "stringr", "purrr", "nycflights13")
faltantes <- paquetes[!vapply(paquetes, requireNamespace, logical(1), quietly = TRUE)]
if (length(faltantes)) stop("Instale estos paquetes con install.packages(): ", paste(faltantes, collapse = ", "))
suppressPackageStartupMessages({library(dplyr); library(tidyr); library(ggplot2); library(readr); library(tibble); library(stringr); library(purrr); library(nycflights13)})
if (!file.exists("Laboratorio_R_NYCFlights.Rproj")) stop("Abra primero el archivo .Rproj desde RStudio.")
dir.create("resultados/tablas", recursive = TRUE, showWarnings = FALSE)
dir.create("resultados/figuras", recursive = TRUE, showWarnings = FALSE)
vuelos <- nycflights13::flights
cat("Configuración correcta. Filas:", nrow(vuelos), "Columnas:", ncol(vuelos), "\n")
stopifnot(nrow(vuelos) == 336776L, all(c("dep_delay", "arr_delay", "carrier", "origin") %in% names(vuelos)))
