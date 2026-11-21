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

# BLOQUE 4 | 60 min | Calidad, NA, atípicos y transformaciones
# PREGUNTAS PARA DISCUTIR EN CLASE:
# - ¿Un valor extremo es necesariamente un error?
# - ¿Qué observaciones excluimos al eliminar NA?
# DINÁMICA: primero anticipamos, después ejecutamos y finalmente interpretamos.
source("scripts/00_configuracion.R")
# Auditoría de ausencia: no asumir que todos los NA son cancelaciones.
auditoria <- vuelos |> summarise(
  n = n(), na_salida = sum(is.na(dep_delay)), na_llegada = sum(is.na(arr_delay)),
  na_hora_salida = sum(is.na(dep_time)), na_hora_llegada = sum(is.na(arr_time)))
print(auditoria)
print(vuelos |> count(sin_dep = is.na(dep_delay), sin_arr = is.na(arr_delay)))
# Duplicados exactos frente a llaves de negocio: no son equivalentes.
print(c(duplicados_exactos = nrow(vuelos) - nrow(distinct(vuelos))))
# Diagnóstico de extremos por IQR: sólo señalización, no borrado automático.
q <- quantile(vuelos$dep_delay, c(.25, .75), na.rm = TRUE)
lim_inf <- q[[1]] - 1.5 * (q[[2]] - q[[1]])
lim_sup <- q[[2]] + 1.5 * (q[[2]] - q[[1]])
vuelos_auditados <- vuelos |>
  mutate(es_extremo_iqr = !is.na(dep_delay) & (dep_delay < lim_inf | dep_delay > lim_sup),
         retraso_categoria = case_when(
           is.na(dep_delay) ~ "No observado",
           dep_delay <= 0 ~ "A tiempo o adelantado",
           dep_delay <= 15 ~ "Retraso de 1 a 15 min",
           TRUE ~ "Retraso mayor a 15 min"),
         retraso_z = as.numeric(scale(dep_delay)))
print(vuelos_auditados |> count(retraso_categoria))
print(vuelos_auditados |> summarise(extremos = sum(es_extremo_iqr)))
# Min-max: sólo datos observados; rango no degenerado.
rango <- range(vuelos$dep_delay, na.rm = TRUE)
vuelos_auditados <- vuelos_auditados |>
  mutate(retraso_minmax = if (diff(rango) > 0) (dep_delay - rango[1]) / diff(rango) else NA_real_)
# Sensibilidad: comparar exclusión de extremos, NO sustituir análisis principal.
comparacion <- tibble(escenario = c("Observados", "Sin extremos IQR"),
  n = c(sum(!is.na(vuelos$dep_delay)), sum(!is.na(vuelos$dep_delay) & !vuelos_auditados$es_extremo_iqr)),
  media = c(mean(vuelos$dep_delay, na.rm = TRUE),
            mean(vuelos$dep_delay[!vuelos_auditados$es_extremo_iqr], na.rm = TRUE)))
print(comparacion)
# Datos sintéticos alterados: NO son observaciones originales de nycflights13.
didacticos <- readr::read_csv("datos/datos_alterados_didacticos.csv", show_col_types = FALSE)
print(didacticos)
print(didacticos |> count(origin, sort = TRUE))
limpios <- didacticos |>
  mutate(origin = str_to_upper(str_trim(origin)),
         carrier = str_to_upper(str_trim(carrier)),
         dep_delay = suppressWarnings(as.numeric(dep_delay))) |>
  distinct(id, .keep_all = TRUE)
print(limpios)
print(limpios |> summarise(faltantes = sum(is.na(dep_delay))))
# Imputación demostrativa SOLO sobre copia sintética y sin sentido inferencial.
mediana_sintetica <- median(limpios$dep_delay, na.rm = TRUE)
limpios <- limpios |> mutate(dep_delay_imputado = replace_na(dep_delay, mediana_sintetica))
readr::write_csv(limpios, "resultados/tablas/datos_didacticos_limpios.csv")
readr::write_csv(comparacion, "resultados/tablas/sensibilidad_extremos.csv")
# EJERCICIO E: Calcule % de NA por columna.
# EJERCICIO P: ¿Cuándo imputar con mediana introduce sesgo?
# EJERCICIO A: Compare conclusiones con y sin extremos, por aeropuerto.
