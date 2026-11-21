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

# BLOQUE 2 | 60 min | Selección, transformación, grupos y joins
# PREGUNTAS PARA DISCUTIR EN CLASE:
# - ¿Cuántas filas esperamos antes y después de una unión?
# - ¿Qué significa el denominador de un porcentaje?
# DINÁMICA: primero anticipamos, después ejecutamos y finalmente interpretamos.
source("scripts/00_configuracion.R")
seleccion <- vuelos |>
  filter(origin == "JFK", !is.na(dep_delay)) |>
  select(year, month, day, carrier, flight, origin, dest, dep_delay) |>
  arrange(desc(dep_delay))
print(head(seleccion, 5))
resumen <- vuelos |>
  mutate(retraso_mayor_15 = !is.na(dep_delay) & dep_delay > 15) |>
  group_by(origin, carrier) |>
  summarise(n_registros = n(), n_validos = sum(!is.na(dep_delay)),
            media = mean(dep_delay, na.rm = TRUE),
            pct_mayor_15_validos = if (sum(!is.na(dep_delay)) > 0)
              100 * sum(dep_delay > 15, na.rm = TRUE) / sum(!is.na(dep_delay)) else NA_real_,
            .groups = "drop") |>
  arrange(origin, desc(n_registros))
print(head(resumen, 10))
# Comprobación de llave única de airlines
stopifnot(!anyDuplicated(nycflights13::airlines$carrier))
vuelos_con_aerolinea <- vuelos |>
  left_join(nycflights13::airlines, by = "carrier", relationship = "many-to-one")
stopifnot(nrow(vuelos_con_aerolinea) == nrow(vuelos))
print(vuelos_con_aerolinea |> count(name, sort = TRUE) |> head(8))
# Relación weather: origin + time_hour. Verificar unicidad antes de unir.
weather_keys <- nycflights13::weather |> count(origin, time_hour) |> filter(n > 1)
print(weather_keys)
if (nrow(weather_keys) == 0) {
  vuelos_clima <- vuelos |> left_join(
    nycflights13::weather |> select(origin, time_hour, temp, humid, wind_speed),
    by = c("origin", "time_hour"), relationship = "many-to-one")
  stopifnot(nrow(vuelos_clima) == nrow(vuelos))
  print(vuelos_clima |> summarise(con_temperatura = sum(!is.na(temp))))
} else {
  message("No se hizo la unión meteorológica: las llaves no son únicas.")
}
readr::write_csv(resumen, "resultados/tablas/resumen_aeropuerto_aerolinea.csv")
# EJERCICIO E: Calcule vuelos por mes y aeropuerto.
# EJERCICIO P: Explique por qué una unión puede multiplicar filas.
# EJERCICIO A: Utilice anti_join() para detectar claves sin correspondencia.
