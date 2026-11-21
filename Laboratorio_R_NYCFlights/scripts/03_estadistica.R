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

# BLOQUE 3 | 60 min | Estadística descriptiva e interpretación
# PREGUNTAS PARA DISCUTIR EN CLASE:
# - ¿Por qué media y mediana pueden diferir?
# - ¿Una correlación demuestra causalidad?
# DINÁMICA: primero anticipamos, después ejecutamos y finalmente interpretamos.
source("scripts/00_configuracion.R")
# Media, mediana, varianza muestral, sd, cuantiles e IQR
x <- vuelos$dep_delay
print(c(n_validos = sum(!is.na(x)), media = mean(x, na.rm = TRUE),
        mediana = median(x, na.rm = TRUE), varianza = var(x, na.rm = TRUE),
        desviacion = sd(x, na.rm = TRUE), iqr = IQR(x, na.rm = TRUE)))
print(quantile(x, c(0, .25, .5, .75, .9, .95, 1), na.rm = TRUE))
indicadores <- vuelos |>
  group_by(carrier) |>
  summarise(n_registros = n(), n_validos = sum(!is.na(dep_delay)),
            media = if (n_validos > 0) mean(dep_delay, na.rm = TRUE) else NA_real_,
            mediana = if (n_validos > 0) median(dep_delay, na.rm = TRUE) else NA_real_,
            desviacion = if (n_validos > 1) sd(dep_delay, na.rm = TRUE) else NA_real_,
            proporcion_mayor_15 = if (n_validos > 0) mean(dep_delay[!is.na(dep_delay)] > 15) else NA_real_,
            .groups = "drop") |>
  arrange(desc(n_registros))
print(indicadores)
# Correlación descriptiva, sólo pares completos
pares <- vuelos |> select(dep_delay, arr_delay, distance, air_time)
print(cor(pares, use = "pairwise.complete.obs"))
# No interprete correlación como causalidad; el número de pares varía.
print(pares |> summarise(across(everything(), ~sum(!is.na(.x)))))
readr::write_csv(indicadores, "resultados/tablas/indicadores_aerolinea.csv")
# EJERCICIO E: Resuma arr_delay por origin.
# EJERCICIO P: ¿Por qué media y mediana no coinciden?
# EJERCICIO A: Compare correlaciones de salida/llegada por aeropuerto.
