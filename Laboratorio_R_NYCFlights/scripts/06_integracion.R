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

# BLOQUE 6 | 60 min | Funciones, control de flujo, vectorización y pipeline
# PREGUNTAS PARA DISCUTIR EN CLASE:
# - ¿Podemos reproducir este análisis desde una sesión nueva?
# - ¿Qué resultados dependen de nuestras decisiones?
# DINÁMICA: primero anticipamos, después ejecutamos y finalmente interpretamos.
source("scripts/00_configuracion.R")
source("R/funciones_auxiliares.R")
# Función reutilizable: devuelve resumen y controla ausencia de casos válidos.
print(resumen_retrasos(vuelos, "origin"))
# Condicional: aviso si la proporción de NA supera un umbral didáctico.
p_na <- mean(is.na(vuelos$dep_delay))
if (p_na > 0.05) message("Más del 5% de retrasos de salida no observados") else message("Hasta 5% no observados")
# Ciclo vs vectorización: mismo objetivo, sin afirmar mejoras medidas de rendimiento.
meses <- 1:12
medias_ciclo <- numeric(length(meses))
for (i in seq_along(meses)) {
  medias_ciclo[i] <- mean(vuelos$dep_delay[vuelos$month == meses[i]], na.rm = TRUE)
}
medias_vector <- vuelos |> group_by(month) |>
  summarise(media = mean(dep_delay, na.rm = TRUE), .groups = "drop")
stopifnot(isTRUE(all.equal(medias_ciclo, medias_vector$media)))
print(medias_vector)
# purrr: map_dbl para aplicar una función a una lista de subconjuntos
por_origen <- split(vuelos$dep_delay, vuelos$origin)
print(purrr::map_dbl(por_origen, ~mean(.x, na.rm = TRUE)))
# Pipeline final con verificaciones
salida <- vuelos |>
  mutate(fecha = as.Date(sprintf("%04d-%02d-%02d", year, month, day))) |>
  group_by(origin, month) |>
  summarise(n_total = n(), n_validos = sum(!is.na(dep_delay)),
            media = if (n_validos > 0) mean(dep_delay, na.rm = TRUE) else NA_real_,
            mediana = if (n_validos > 0) median(dep_delay, na.rm = TRUE) else NA_real_,
            .groups = "drop")
stopifnot(nrow(salida) == 36L, all(salida$n_validos <= salida$n_total))
readr::write_csv(salida, "resultados/tablas/resumen_final_mensual.csv")
writeLines(c("Reporte de ejecución", paste("Fecha:", Sys.Date()),
             paste("R:", getRversion()), "Paquetes cargados:",
             paste(names(sessionInfo()$otherPkgs), collapse = ", ")),
           "resultados/tablas/registro_ejecucion.txt")
# EJERCICIO E: Cree función que resuma arr_delay por grupo.
# EJERCICIO P: Explique cuándo un ciclo es más legible que un pipeline.
# EJERCICIO A: Compare system.time() en operaciones equivalentes; NO extrapole de una medición.
