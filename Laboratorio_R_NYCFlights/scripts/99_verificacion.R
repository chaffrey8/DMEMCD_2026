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

# Prueba de integridad posterior a la ejecución de todos los bloques.
source("scripts/00_configuracion.R")
archivos <- c("resultados/tablas/muestra_12_vuelos.csv",
 "resultados/tablas/resumen_aeropuerto_aerolinea.csv",
 "resultados/tablas/indicadores_aerolinea.csv",
 "resultados/tablas/datos_didacticos_limpios.csv",
 "resultados/tablas/sensibilidad_extremos.csv",
 "resultados/tablas/resumen_final_mensual.csv",
 "resultados/tablas/registro_ejecucion.txt",
 paste0("resultados/figuras/", sprintf("%02d", 1:7), "_", c("barras_aeropuerto", "histograma_retraso", "cajas_retraso", "retraso_mensual", "dispersion_retrasos", "facetas_medianas", "calor_correlaciones"), ".png"))
faltantes <- archivos[!file.exists(archivos)]
if (length(faltantes)) stop("Faltan archivos; ejecute los bloques previos:\n", paste(faltantes, collapse = "\n"))
res <- readr::read_csv("resultados/tablas/resumen_final_mensual.csv", show_col_types = FALSE)
stopifnot(nrow(res) == 36L, all(res$n_validos <= res$n_total), sum(res$n_total) == nrow(vuelos))
cat("VERIFICACIÓN COMPLETA: 14 salidas presentes; 36 grupos origen-mes y totales coherentes.\n")
