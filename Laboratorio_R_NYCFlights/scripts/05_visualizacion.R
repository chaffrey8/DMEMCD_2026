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

# BLOQUE 5 | 60 min | Gramática de gráficos y comunicación visual
# PREGUNTAS PARA DISCUTIR EN CLASE:
# - ¿Qué pregunta responde cada geometría?
# - ¿Qué distorsión introduciría una escala mal elegida?
# DINÁMICA: primero anticipamos, después ejecutamos y finalmente interpretamos.
source("scripts/00_configuracion.R")
tema <- theme_minimal(base_size = 12)
guardar <- function(grafico, nombre, ancho = 9, alto = 5) {
  ggplot2::ggsave(file.path("resultados/figuras", nombre), grafico,
                  width = ancho, height = alto, units = "in", dpi = 160)
}
# 1. Barras: frecuencias por aeropuerto
p1 <- vuelos |> count(origin) |>
  ggplot(aes(x = origin, y = n)) + geom_col(fill = "#317C98") +
  labs(title = "Vuelos registrados por aeropuerto de origen", x = "Aeropuerto", y = "Registros") + tema
guardar(p1, "01_barras_aeropuerto.png")
# 2. Histograma: conservar adelantos; mostrar hasta percentil 99 para legibilidad
p99 <- unname(quantile(vuelos$dep_delay, .99, na.rm = TRUE))
p2 <- vuelos |> filter(!is.na(dep_delay)) |>
  ggplot(aes(x = dep_delay)) + geom_histogram(binwidth = 10, boundary = 0, fill = "#3D8F82", color = "white") +
  coord_cartesian(xlim = c(-30, p99)) +
  labs(title = "Distribución de retrasos de salida", subtitle = "Vista ampliada: extremos fuera del eje no se eliminan del cálculo", x = "Retraso de salida (min)", y = "Frecuencia") + tema
guardar(p2, "02_histograma_retraso.png")
# 3. Caja: distribución por aeropuerto
p3 <- vuelos |> filter(!is.na(dep_delay)) |>
  ggplot(aes(x = origin, y = dep_delay)) + geom_boxplot(fill = "#A7C6D6", outlier.alpha = .1) +
  coord_cartesian(ylim = c(-40, 150)) +
  labs(title = "Retrasos por aeropuerto", subtitle = "Vista ampliada, sin eliminar observaciones", x = "Origen", y = "Retraso (min)") + tema
guardar(p3, "03_cajas_retraso.png")
# 4. Serie temporal agregada mensual
mensual <- vuelos |> group_by(month) |>
  summarise(n_validos = sum(!is.na(dep_delay)), media = mean(dep_delay, na.rm = TRUE), .groups = "drop")
p4 <- ggplot(mensual, aes(x = month, y = media)) + geom_line(linewidth = 1, color = "#5A6FA8") +
  geom_point(size = 2) + scale_x_continuous(breaks = 1:12) +
  labs(title = "Retraso medio de salida por mes", x = "Mes", y = "Minutos") + tema
guardar(p4, "04_retraso_mensual.png")
# 5. Dispersión con muestra reproducible para evitar sobreposición masiva
set.seed(2026)
pares <- vuelos |> filter(!is.na(dep_delay), !is.na(arr_delay))
muestra <- pares |> slice_sample(n = min(6000L, nrow(pares)))
p5 <- ggplot(muestra, aes(x = dep_delay, y = arr_delay)) + geom_point(alpha = .12, size = .6, color = "#377F9A") +
  coord_cartesian(xlim = c(-50, 250), ylim = c(-100, 300)) +
  labs(title = "Retrasos de salida y llegada", subtitle = "Muestra aleatoria reproducible; asociación no implica causalidad", x = "Salida (min)", y = "Llegada (min)") + tema
guardar(p5, "05_dispersion_retrasos.png")
# 6. Facetas: medianas mensuales por origen
por_mes <- vuelos |> group_by(origin, month) |>
  summarise(mediana = median(dep_delay, na.rm = TRUE), .groups = "drop")
p6 <- ggplot(por_mes, aes(x = month, y = mediana)) + geom_line(color = "#A66E51") +
  geom_point(color = "#A66E51") + facet_wrap(~origin) + scale_x_continuous(breaks = c(1, 3, 6, 9, 12)) +
  labs(title = "Mediana mensual por aeropuerto", x = "Mes", y = "Minutos") + tema
guardar(p6, "06_facetas_medianas.png")
# 7. Mapa de calor de correlaciones (pares completos por pareja)
matriz <- cor(vuelos |> select(dep_delay, arr_delay, air_time, distance), use = "pairwise.complete.obs")
calor <- as.data.frame(as.table(matriz))
p7 <- ggplot(calor, aes(Var1, Var2, fill = Freq)) + geom_tile(color = "white") +
  geom_text(aes(label = sprintf("%.2f", Freq)), size = 3) +
  scale_fill_gradient2(low = "#B24D5A", mid = "white", high = "#347F9A", midpoint = 0, limits = c(-1, 1)) +
  coord_equal() + labs(title = "Correlaciones de Pearson", subtitle = "Número de pares válidos puede variar", x = NULL, y = NULL, fill = "r") + tema
guardar(p7, "07_calor_correlaciones.png", 7, 6)
print(p1); print(p2); print(p3); print(p4); print(p5); print(p6); print(p7)
# EJERCICIO E: Construya barras de proporción de retrasos > 15 min por aeropuerto.
# EJERCICIO P: Identifique el riesgo de ejes truncados o escalas no comparables.
# EJERCICIO A: Cree una visualización de densidad o violín y defienda su elección.
