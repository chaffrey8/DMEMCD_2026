# Equipo 15. Análisis exploratorio de Olist

Entregable 1 del Diplomado en Métodos Estadísticos y Matemáticos para la Ciencia de Datos (2026). El análisis recorre el *Brazilian E-Commerce Public Dataset* de Olist, pedidos reales anonimizados de 2016 a 2018, y deja el recorrido listo para ejecutarse de nuevo.

## Objetivo

Explorar el extracto, revisar la calidad de las tablas, aplicar las transformaciones que el análisis necesita y construir visualizaciones que muestren patrones de la operación.

Tres preguntas, sobre la misma lectura de los CSV:

1. ¿Cuánto se pasa un pedido del día prometido, y qué patrones de esa entrega bajan la nota de la reseña?
2. ¿Cómo se distribuyen el precio y el flete, cómo se concentran las ventas y cómo cambian según el estado del vendedor?
3. ¿Cómo se reparten los estatus, los tiempos de entrega, la conciliación entre pago y costo, las categorías, las regiones y la distancia entre cliente y vendedor?

La libreta que responde las tres es [`eda_olist.ipynb`](eda_olist.ipynb). Conserva una subsección de análisis por cada cuaderno de origen.

## Presentación

La presentación que acompaña el proyecto y el video está en Google Slides, con el título EDA_Olist, es de acceso público:

[https://docs.google.com/presentation/d/1UxybSwQy7YEI3Vzmf5iDbYUsCKR0ml4pCiwF-HewQkw/edit?usp=sharing](https://docs.google.com/presentation/d/1UxybSwQy7YEI3Vzmf5iDbYUsCKR0ml4pCiwF-HewQkw/edit?usp=sharing)

## Integrantes

- Laura Berenice Badillo Santos
- Eduardo Sánchez Benítez
- Juan Alberto Jaimes Romero
- Juan Manuel Sóstenes Sánchez
- Angel Noriega Cabrera

## Contenido del repositorio

Análisis del entregable, en la raíz:

| Archivo | Qué contiene |
| --- | --- |
| [`eda_olist.ipynb`](eda_olist.ipynb) | Análisis completo, con tablas y figuras ya ejecutadas. Es el archivo que hay que volver a correr. |
| [`eda.ipynb`](eda.ipynb) | Entregas tardías y nota de la reseña. |
| [`Proyecto_JM.ipynb`](Proyecto_JM.ipynb) | Precio, flete y vendedores. |
| [`Proyecto_Angel.ipynb`](Proyecto_Angel.ipynb) | Órdenes, pagos, productos, regiones y distancia. Versión en Python de [`Proyecto_Final_Olist_FINAL.Rmd`](Proyecto_Final_Olist_FINAL.Rmd). |
| [`Proyecto_Eduardo.ipynb`](Proyecto_Eduardo.ipynb) | Lectura inicial de clientes, geolocalización, productos y vendedores. |
| [`Python/requirements.txt`](Python/requirements.txt) | Dependencias de Python. |
| [`Python/olist_tools.py`](Python/olist_tools.py) | Lectura de tablas. La usan `Proyecto_JM.ipynb` y `Proyecto_Eduardo.ipynb`. `eda_olist.ipynb` lee los CSV con pandas. |

`Python/eda.ipynb`, `Python/eda_atraso.ipynb` y `Python/eda_espera.ipynb` son borradores del análisis de entregas. El resto de `Python/` (sesiones, ejercicios, ...) es material de clase del diplomado y no forma parte de este análisis.

## Cómo reproducir el análisis

Hace falta Python 3.11 o posterior. Esta corrida se comprobó con Python 3.14, pandas 3.1, NumPy 2.5 y matplotlib 3.11. Los comandos se ejecutan desde la raíz del repositorio.

```bash
python3 -m venv .venv
source .venv/bin/activate
python -m pip install -U pip
python -m pip install -r Python/requirements.txt
```

En Windows, el entorno se activa con `.venv\Scripts\activate`.

Los CSV se obtienen aparte, como se indica en la sección de datos. Si el clon de Olist queda en `~/projects/work-at-olist-data`, la libreta lo encuentra sola. En cualquier otra ruta:

```bash
export OLIST_DATA_DIR="/ruta/a/work-at-olist-data/datasets"
```

Para regenerar tablas y figuras dentro de la libreta:

```bash
jupyter nbconvert --to notebook --execute --inplace eda_olist.ipynb
```

También se puede abrir `eda_olist.ipynb` en Jupyter y ejecutar todas las celdas, con el directorio de trabajo en la raíz del repositorio. La libreta busca los nueve CSV en este orden: la variable `OLIST_DATA_DIR`, `~/projects/work-at-olist-data/datasets` y carpetas hermanas del directorio de trabajo. Al terminar, la sección **Conclusión** imprime tres validaciones. Si una cifra deja de cumplirse, la celda se detiene.

Las salidas ya guardadas en `eda_olist.ipynb` se leen sin volver a ejecutar. `Proyecto_JM.ipynb` y `Proyecto_Eduardo.ipynb` usan el mismo directorio de datos e importan `olist_tools` desde `Python/`.

`Proyecto_Final_Olist_FINAL.Rmd` es el script original en R del análisis de órdenes. Sus `read_csv` apuntan a un disco local de Windows. Para correrlo hay que sustituir esas rutas por la carpeta `datasets` y tener instalados `tidyverse`, `readr`, `ggplot2`, `data.table` y `openxlsx`. La reproducción que cierra con las validaciones es la de Python.

## Dependencias

[`Python/requirements.txt`](Python/requirements.txt):

```text
numpy>=1.26
pandas>=2.1
matplotlib>=3.8
scipy>=1.11
notebook>=7
nbformat>=5
ipykernel>=6
```

`eda_olist.ipynb` usa pandas, NumPy, matplotlib e IPython. IPython llega con `notebook` e `ipykernel`. La libreta no instala paquetes al ejecutarse.

## Herramientas

- **Python, Jupyter, pandas, NumPy y matplotlib.**  
- **RStudio.**   
- **Power BI.**  
- **Google Slides.**  
- **Grok.**  

## Datos y licencia

El conjunto es el *Brazilian E-Commerce Public Dataset* de Olist: cerca de 100 mil pedidos de tiendas brasileñas entre 2016 y 2018. Olist conecta comercios con canales de venta en línea; el vendedor prepara el pedido y un socio logístico lo entrega. Los nombres de comercios y de quienes escriben reseñas están sustituidos. Los cuadernos solo leen los CSV.

Los CSV quedan fuera de este repositorio. Hay que conseguirlos de una copia pública:

1. [github.com/olist/work-at-olist-data](https://github.com/olist/work-at-olist-data), carpeta `datasets/`. El repositorio se publica con licencia MIT. Es la copia que buscan los cuadernos.

   ```bash
   git clone https://github.com/olist/work-at-olist-data.git "$HOME/projects/work-at-olist-data"
   ```

2. [Brazilian E-Commerce Public Dataset by Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce) en Kaggle, con licencia [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/). Pide atribución a Olist, limita el uso a fines no comerciales y pide que las obras derivadas se compartan con la misma licencia. La descarga requiere cuenta de Kaggle. Con esa copia, los CSV no se vuelven a publicar en este repositorio: se cita el conjunto y se dejan fuera del historial.

Los nueve archivos, con el tamaño de la copia usada:

| Archivo | Tamaño aprox. | Contenido |
| --- | ---: | --- |
| `olist_orders_dataset.csv` | 16.8 MB | Pedidos y fechas |
| `olist_order_reviews_dataset.csv` | 13.8 MB | Reseñas y nota |
| `olist_order_items_dataset.csv` | 14.3 MB | Artículos, precio y flete |
| `olist_order_payments_dataset.csv` | 5.4 MB | Pagos |
| `olist_customers_dataset.csv` | 8.2 MB | Cliente y estado |
| `olist_products_dataset.csv` | 2.3 MB | Producto, categoría y medidas |
| `olist_sellers_dataset.csv` | 0.2 MB | Vendedor y estado |
| `product_category_name_translation.csv` | 3 KB | Traducción de categorías |
| `olist_geolocation_dataset.csv` | 58.4 MB | Prefijo postal y coordenadas |

## Resultados y visualizaciones

Las cifras y las gráficas quedan en las salidas de [`eda_olist.ipynb`](eda_olist.ipynb), sección **Análisis exploratorio** y sección **Conclusión**. Hay 24 imágenes en la libreta. Al ejecutarla de nuevo, las cuatro gráficas de precio y vendedores se escriben además en `figures/`.

### Entregas tardías y nota de la reseña

De 99,441 pedidos, 96,476 tienen fecha de entrega. El 91.9% llega antes del día prometido, el 1.3% ese día y el 6.8% después. En el grupo tarde, la mediana del atraso es de 7 días y el percentil 90 es de 22. Ese tiempo está en el tránsito: su mediana pasa de 6.9 días, cuando el pedido cumple, a 26.2 cuando llega tarde.

La nota media es 4.29 si el pedido llega el día prometido o antes, 2.27 si llega tarde y 1.75 si no hay fecha de entrega. La caída es un escalón: 4.32 con ocho días o más de adelanto, 4.04 el día prometido, 3.29 con uno a tres días de atraso y 1.67 con ocho a catorce. Una espera de más de 30 días que cumple la promesa promedia 3.66; la misma espera, tarde, 1.87.

El 70% de los pedidos tarde se reseña antes de recibir el paquete, con nota 1.66. Quienes reseñan después de un arribo tarde promedian 3.72. El precio y el flete, dentro de São Paulo y de un solo artículo a tiempo, casi no mueven la nota. En los estados con al menos 400 pedidos, la tasa de atraso y la nota media se mueven juntas (correlación −0.90). Marzo de 2018 concentra la tardanza y la nota más baja de la serie mensual.

Figuras de esta pregunta, en la libreta:

- Atraso de calendario, entre −40 y 40 días
- Mediana de cada tramo, con las fechas en orden
- Entrega tarde al cliente, según el límite del vendedor
- Composición de la nota en tres situaciones
- Nota media según los días de atraso
- Nota media según la espera y la tardanza
- Nota media según el atraso y el momento de la respuesta
- Cuánto baja la nota media
- Tasa de atraso y nota media, por mes de compra
- Nota media y tasa de atraso, por estado del cliente

### Precio, flete y vendedores

El precio es asimétrico: mediana de 74.99 BRL y media de 120.65 BRL. El flete mediano es de 16.27 BRL. El vendedor usual vendió 8 artículos en todo el periodo. Quienes vendieron más de 100 artículos son cerca del 8% de los vendedores y generan el 53% de las ventas. Quienes vendieron 5 artículos o menos son el 43% de los vendedores y generan cerca del 5% de las ventas.

São Paulo concentra el 59% de los vendedores y el 71% de los artículos, con flete mediano de 15.38 BRL. Espírito Santo tiene el flete mediano más alto, 33.03 BRL. El ticket mediano por pedido es de 84.99 BRL, y el 91% de los pedidos lleva un solo artículo de cada vendedor.

Esas cuatro gráficas se guardan en `figures/` al ejecutar la libreta:

- `figures/3_1a_histogramas.png`
- `figures/3_2_segmentos_vendedores.png`
- `figures/3_3_precio_flete_por_estado_vendedor.png`
- `figures/3_4_ticket_por_estado_vendedor.png`

### Órdenes, pagos y productos

El 97.0% de las órdenes está entregado. El día pico es el viernes 24 de noviembre de 2017, Black Friday en Brasil: 1,147 órdenes entregadas. Entre las entregadas, el tiempo real ponderado por el monto pagado es de 13.4 días y el estimado es de 25.5 días. El 6.8% llegó después de la fecha estimada.

El pago y el costo de artículos más envío coinciden al peso redondeado en 98,347 órdenes (98.9%). Los artículos se concentran en la región Sudeste (68.7% de las filas). La correlación entre el peso medio del producto y su costo medio de envío es 0.65. La distancia lineal, en grados entre códigos postales, queda definida para el 99.5% de los artículos y su mediana por orden es de 4.08 grados. Esa cifra no mide kilómetros de carretera.

Figuras de esta pregunta, en la libreta:

- Proporción de órdenes por estatus
- Conteo de las órdenes a través del tiempo
- Tiempo estimado y tiempo real, ponderados por el monto pagado
- Pago realizado por orden y costo de artículos más envío
- Conteo de órdenes por año, trimestre, mes y tipo de pago
- Artículos por categoría general
- Artículos de pedidos por región del cliente
- Distancia lineal aproximada entre cliente y vendedor

La sección **Alcance** de `eda_olist.ipynb` fija lo que el extracto no alcanza a decir: la fecha prometida no se reconstruye desde el transportista, un pedido sin fecha de entrega se queda así, y la distancia en grados no es una ruta.

## Contribuciones

El historial de git concentra las subidas en una cuenta. Esta tabla sigue el cuaderno de cada integrante.

| Integrante | Aporte en el repositorio |
| --- | --- |
| Juan Alberto Jaimes Romero | Pregunta de entregas tardías y nota de la reseña (`eda.ipynb`, con borradores en `Python/eda_atraso.ipynb` y `Python/eda_espera.ipynb`). Integración de los tres análisis en `eda_olist.ipynb`. Traducción a Python del análisis de órdenes (`Proyecto_Angel.ipynb`). |
| Juan Manuel Sóstenes Sánchez | Precio, flete, concentración de vendedores y ticket por estado (`Proyecto_JM.ipynb`). |
| Angel Noriega Cabrera | Órdenes, tiempos de entrega, conciliación de pagos, categorías, regiones y distancia (`Proyecto_Final_Olist_FINAL.Rmd`). |
| Eduardo Sánchez Benítez | Lectura de la estructura de clientes, geolocalización, productos y vendedores (`Proyecto_Eduardo.ipynb`). |
| Laura Berenice Badillo Santos | Integrante del equipo, registrada en los cuadernos. Su aporte concreto se anota en esta fila. |
