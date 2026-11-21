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

# BLOQUE 1 | 60 min | Tipos, estructuras, importación y diagnóstico
# PREGUNTAS PARA DISCUTIR EN CLASE:
# - ¿Cuál es nuestra unidad de observación?
# - ¿En qué se diferencia NA de cero?
# DINÁMICA: primero anticipamos, después ejecutamos y finalmente interpretamos.
source("scripts/00_configuracion.R")
# Vectores, listas, factores, matrices y tibbles
edades <- c(19, 21, NA, 23)
lista <- list(nombres = c("Ana", "Luis"), edades = edades)
matriz <- matrix(1:6, nrow = 2)
factor_aeropuerto <- factor(c("JFK", "LGA", "JFK"))
print(list(vector = edades, lista = lista, matriz = matriz, factor = factor_aeropuerto))
print(class(vuelos)); print(dim(vuelos)); print(names(vuelos))
dplyr::glimpse(vuelos)
print(head(vuelos, 4))
print(summary(vuelos$dep_delay))
print(vuelos |> count(origin, name = "n_vuelos"))
# NA no es 0; un retraso negativo representa adelanto respecto al horario.
print(sum(is.na(vuelos$dep_delay)))
print(mean(vuelos$dep_delay, na.rm = TRUE))
# Ejemplo de ida y vuelta CSV usando una muestra pequeña
muestra <- vuelos |> slice_head(n = 12)
readr::write_csv(muestra, "resultados/tablas/muestra_12_vuelos.csv", na = "")
reimportada <- readr::read_csv("resultados/tablas/muestra_12_vuelos.csv", show_col_types = FALSE)
stopifnot(nrow(reimportada) == 12)
# EJERCICIO E: Identifique la unidad de análisis y 5 variables de distinta naturaleza.
# EJERCICIO P: ¿Por qué dep_delay puede ser negativo? ¿Qué significa NA?
# EJERCICIO A: Compare class(), typeof() y str() para tres objetos.
