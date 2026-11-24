# Rentabilidad y Eficiencia Comercial en Retail Outdoor

**Proyecto integrador — Módulo I: Preprocesamiento y técnicas básicas de visualización de datos**
Diplomado: Métodos estadísticos y matemáticos para la ciencia de datos (2026)

**Integrantes:**
- Aragón Aragón Irving Alfonso 
- Arenas Mendez Ana Melissa 
- Castillo De Gante Alejandro 
- Pérez Ocampo Mario Alberto 
- Pérez Olalde Danna Paola 

---

## 1. Objetivo del proyecto

En una operación minorista que ofrece descuentos de hasta 20 % y envío gratis desde \$75 USD, vender más no implica necesariamente ganar más. Este proyecto realiza un **Análisis Exploratorio de Datos (EDA)** para entender cómo los incentivos comerciales, el estado de los cobros y las devoluciones se relacionan con la utilidad bruta del negocio, usando estadística descriptiva, auditoría de calidad de datos y visualización.

El estudio se delimita a dos preguntas de investigación:

| Eje | Pregunta | Unidad de análisis |
|---|---|---|
| 1. Descuentos y envío gratuito | ¿Cómo interactúan los descuentos promocionales con el umbral de envío gratuito de \$75 USD, y en qué segmentos de órdenes la coincidencia de alto descuento y envío gratis erosiona más el margen bruto? | Orden de compra (`order_id`) |
| 2. Concentración de utilidad y devoluciones | ¿Qué proporción del catálogo activo concentra el 80 % de la utilidad bruta, qué categoría domina ese núcleo y qué parte de esos productos tiene tasas de devolución superiores al promedio de su categoría? | Línea de producto (`order_item_id`) y SKU |

---

## 2. Procedencia y condiciones de uso de los datos

- **Origen:** base de datos relacional sintética de una empresa minorista de equipamiento para actividades al aire libre, generada con el motor GenerateRealData a partir de un esquema SQL y reglas comerciales predefinidas.
- **Periodo:** 1 de enero de 2024 al 29 de septiembre de 2026 (fecha del último pedido), es decir 33 meses. 
- **Canales de venta:** `web`, `app`, `marketplace` y `store`.
- **Reglas de negocio con las que se generó:** costo unitario entre 35 % y 70 % del precio, descuentos de hasta 20 % del subtotal, envío gratis con subtotal ≥ \$75 (tarifa de \$4.99 a \$9.99 en compras menores),estacionalidad con picos en noviembre y diciembre.
- **Condiciones de uso y licencia:** `[completar: licencia / condiciones de la fuente]`. Al ser datos simulados, **no contienen datos personales ni bancarios de personas reales**. Se usan con fines académicos.
- **Implicación:** los patrones observados reflejan reglas de generación fijas y no necesariamente el comportamiento de clientes reales.

### Tablas utilizadas

De las siete tablas de la base original se usaron cinco:

| Archivo | Filas | Contenido |
|---|---:|---|
| `orders.csv` | 90,000 | Pedidos: fecha, canal, estado, subtotal, descuento, envío, impuestos y total |
| `order_items.csv` | 200,000 | Líneas de cada pedido: producto, cantidad, precio unitario, total de línea |
| `products.csv` | 1,500 | Catálogo: SKU, categoría, marca, precio, costo, peso, si está activo |
| `payments.csv` | 90,000 | Pagos: método, monto, fecha de pago y estado |
| `returns.csv` | 8,000 | Devoluciones: motivo, monto reembolsado, fecha de solicitud y estado |

---

## 3. Estructura del repositorio

```
├── data/
│   ├── raw/                       # CSV originales (los lee el notebook)
│   │   ├── orders.csv
│   │   ├── order_items.csv
│   │   ├── products.csv
│   │   ├── payments.csv
│   │   └── returns.csv
│   └── processed/
│       └── products_clean.csv     # Catálogo sin weight_kg (lo genera el notebook)
├── notebooks/
│   └── Proyecto_integrador.ipynb  # Código, resultados e interpretaciones
├── results/
│   └── figures/                   # Figuras exportadas (ver nota abajo)
├── requirements.txt               # Dependencias
└── README.md
```


---

## 4. Cómo reproducir el análisis

**Requisitos:** Python 3.10 o superior y VS Code con la extensión de Jupyter.

1. Clona el repositorio:
   ```bash
   git clone <URL-del-repositorio>
   cd <nombre-del-repositorio>
   ```
2. Crea y activa un entorno virtual:
   ```bash
   python -m venv .venv
   # Windows (PowerShell)
   .venv\Scripts\Activate.ps1
   # macOS / Linux
   source .venv/bin/activate
   ```
3. Instala las dependencias:
   ```bash
   pip install -r requirements.txt
   ```
4. Verifica que los cinco CSV estén en `data/raw/` (el notebook detecta la raíz del proyecto buscando esa carpeta y falla con un mensaje si falta algún archivo).
5. Abre `notebooks/proyecto_integrador.ipynb` y ejecuta Run All.

**Dependencias principales** (`requirements.txt`): `pandas`, `numpy`, `matplotlib`, `scipy`, `ipython`, `jupyter`.
`[Pega aquí las versiones con las que corrió el equipo: pip freeze | grep -E "pandas|numpy|matplotlib|scipy"]`

---

## 5. Contenido del notebook

1. Planteamiento del problema y comprensión de los datos.
2. Carga de datos y auditoría de tipos (contrato de tipos esperados por tabla).
3. Exploración y estadística descriptiva (tendencia central, dispersión, percentiles, asimetría, frecuencias, correlaciones de Pearson y Spearman).
4. Calidad, limpieza y transformación.
5. Visualización de los datos.
6. Interpretación y conclusiones.

---

## 6. Calidad de los datos y decisiones de limpieza

### Revisiones realizadas

| Revisión | Resultado |
|---|---|
| Llaves primarias (5 tablas) | 0 nulos y 0 duplicados |
| Valores nulos | Solo `products.weight_kg`: 78 de 1,500 (5.2 %) |
| Integridad referencial | 100 % (`items→orders`, `items→products`, `returns→items`) |
| Devoluciones duplicadas por artículo | 0 |
| Fechas | 0 devoluciones anteriores a su compra; 0 pedidos anteriores a la creación del producto; 0 fechas nulas |
| Continuidad temporal | 33 meses consecutivos; de 1,003 días solo 4 sin pedidos (31 de octubre y 31 de diciembre de 2024 y 2025) |
| Reglas de negocio | 0 violaciones de envío gratis (≥ \$75 con envío > 0), 0 descuentos mayores a 20 %, 0 devoluciones no rechazadas en órdenes canceladas |
| Ecuación de facturación `total = subtotal − descuento + envío + impuestos` | 0 diferencias mayores a \$0.01 en 90,000 órdenes |
| Precio cobrado vs. catálogo, `line_total = quantity × unit_price`, reembolso ≤ importe de la línea | 0 inconsistencias en las tres revisiones |


### Decisiones documentadas

**1. Se eliminó la columna `weight_kg`.**
- *Problema:* 78 nulos (5.2 %), presentes en todas las categorías (de 2.04 % en Cooking a 6.72 % en Navigation).
- *Criterios estadísticos:*
  - Chi-cuadrada y Mann-Whitney no encontraron relación entre el faltante y la categoría, el estado activo, el precio ni el costo (p entre 0.66 y 1.00).
  - Kruskal-Wallis no detectó diferencias de peso entre categorías (H = 13.48, p = 0.1422), por lo que imputar por categoría pondría casi el mismo valor en todas.
  - El peso tiene correlaciones cercanas a cero con precio, costo, utilidad, tasa de devolución y tarifa de envío (|r| ≤ 0.05 en Pearson y Spearman).
- *Decisión y efecto:* se descartó la columna y se conservaron los 1,500 productos (`products_clean`: 9 columnas, 0 nulos). Las tablas originales no se modificaron.
- *Limitación:* las pruebas son consistentes con ausencia aleatoria, pero un p-value alto no la demuestra.

**2. Se separaron los pedidos de valor o volumen excepcionalmente alto para el análisis minorista.**
- Con el percentil 99.5 del subtotal (\$3,259.50) y de las unidades por orden (13) se separaron 705 pedidos (0.78 %); se conservaron 89,295 (99.22 %) en `orders_retail` e `items_retail`.
- No se afirma que sean compras mayoristas ni que sean errores: la separación enfoca el análisis. Las tablas originales no se alteran.

**Nota sobre septiembre de 2026:** el último pedido es del 29 de septiembre, por lo que ese mes es parcial y las órdenes más recientes no han completado su ventana de devolución. Su tasa de devolución está subestimada.

---

## 7. Resultados

### Eje 1 — Descuentos y envío gratuito

Margen calculado por orden sobre la venta neta (subtotal menos descuento), con costo de envío estimado de \$7.48 por orden con envío gratis y reembolsos aprobados o pagados.

- **A mayor descuento, menor margen:** En los cuatro tramos de subtotal, las órdenes con descuento de 11–20 % tienen entre 8.6 y 13.4 puntos menos de margen que las que no tienen descuento.
- **El umbral de \$75 genera un quiebre:** Con el envío incluido, el tramo de \$75–90 queda por debajo del de \$60–74.99 en los tres niveles de descuento (41.8 % vs. 46.4 %, 37.4 % vs. 43.5 % y 31.6 % vs. 35.1 %).
- **Segmento más afectado:** subtotal de \$75–90 con descuento de 11–20 %, con margen de 31.6 % tras el envío y 28.7 % tras reembolsos, frente a 48.1 % en órdenes menores a \$60 sin descuento. El envío equivale a 9.2 % del subtotal en ese segmento; en compras mayores a \$90 se diluye (1.3 %).
- **Medir sin el envío lleva a otra conclusión:** en el margen bruto, el tramo de \$75–90 parece el más rentable (51.0 % sin descuento).
- **Doble beneficio:** el umbral se evalúa antes del descuento, por lo que 305 órdenes recibieron envío gratis aunque pagaron menos de \$75.
- **Las devoluciones no cambian el patrón:** restan entre 2.4 y 5.4 puntos sin concentrarse en un segmento.
- **Mejor vs. peor caso (cascada):** 45.0 % de margen restante frente a 24.3 %; la brecha de unos 21 puntos se explica por el descuento (14.9 %) y el envío gratis (9.2 %).


### Eje 2 — Concentración de utilidad y devoluciones por producto

- El 80 % de la utilidad bruta neta (80.03 %) se concentra en 384 de 1,385 SKUs activos (27.73 %).
- 169 de esos 384 SKUs (44.0 %) tienen tasas de devolución superiores al promedio de su categoría.
- Tents lidera el núcleo rentable (95 SKUs, 24.74 %, cerca de \$3.01M USD de utilidad), seguida de Navigation (62 SKUs, 16.15 %) y Sleeping Bags (61 SKUs, 15.89 %).
- Backpacks concentra la mayor presión de devoluciones: 1,081 líneas devueltas y cerca de \$199.7k USD en reembolsos con solo 31 SKUs (8.07 % del núcleo). Le siguen Cooking (554 líneas, 16 SKUs) y Accessories (483 líneas, 12 SKUs).
- Producto más crítico: OUT-00518 (Tundra Hydration Pack), con cerca de \$1.42M USD de utilidad y 493 líneas devueltas de 10,802 vendidas (4.56 %).
- Un mayor volumen de devoluciones no siempre implica una tasa alta: OUT-00490 y OUT-00722 tienen muchas devoluciones pero tasas menores al promedio de su categoría. En cambio, OUT-00529 (5.06 %), OUT-00193 (4.74 %) y OUT-00694 (4.50 %) superan la media de su rubro.
- Las tasas extremas en productos de baja rotación (por ejemplo 12.20 % en 41 líneas) requieren cautela por su muestra pequeña.



### Qué no puede afirmarse

- **Causalidad:** el análisis es descriptivo, los descuentos y el envío gratis coinciden con márgenes menores, pero no se prueba que los causen.
- **Costo real de envío:** la base no lo registra, el segmento más afectado depende del supuesto de \$7.48.
- **Rentabilidad total:** el margen no incluye almacén, marketing, comisiones ni costos de procesar devoluciones.
- **Incentivos en conjunto:** no se puede saber cuántas ventas se habrían perdido sin descuento o sin envío gratis.
- **Celdas pequeñas:** algunas combinaciones tienen entre 111 y 254 órdenes, frente a casi 60,000 en la más grande; diferencias de 1–2 puntos no son relevantes.

---

## 8. Registro de contribuciones del equipo

| Integrante | Parte del proyecto | Contribución |
|---|---|---|
| **Mario Alberto Pérez Ocampo** `[apellidos]` | Secciones 1, 2 y 3 | Planteamiento y descripción de los datos; carga, inventario y auditoría de tipos; estadística descriptiva, frecuencias, comparación por canal y categoría, y correlaciones. |
| **Danna Paola Pérez Olalde** `[apellidos]` | Sección 4, primera parte | Llaves, nulos y decisión sobre `weight_kg`; atípicos con IQR; serie de tiempo, fechas, integridad y reglas de negocio, conclusión. |
| **Irving Alfonso Aragón Aragón** `[apellidos]` | Sección 4, segunda parte | Auditorías financieras y de consistencia; filtro de pedidos de alto valor con el percentil 99.5; conclusión. |
| **Ana Melissa Arenas Mendez** `[apellidos]` | Secciones 5 y 6, Eje 1 | Variables de margen, mapas de calor, gráfico de cascada y conclusiones sobre descuentos y envío gratis. |
| **Alejandro Castillo De Gante** `[apellidos]` | Secciones 5 y 6, Eje 2 | Cálculo de utilidad por SKU, curva de Pareto del 80 %, gráficas 5 a 7 y conclusiones sobre devoluciones. |


---

