# Funciones reutilizables: sin dependencias de variables globales.
resumen_retrasos <- function(datos, variable_grupo = "origin") {
  stopifnot(is.data.frame(datos), variable_grupo %in% names(datos), "dep_delay" %in% names(datos))
  datos |>
    dplyr::group_by(.data[[variable_grupo]]) |>
    dplyr::summarise(n_total = dplyr::n(), n_validos = sum(!is.na(.data$dep_delay)),
                     media = if (n_validos > 0) mean(.data$dep_delay, na.rm = TRUE) else NA_real_,
                     mediana = if (n_validos > 0) median(.data$dep_delay, na.rm = TRUE) else NA_real_,
                     .groups = "drop")
}
