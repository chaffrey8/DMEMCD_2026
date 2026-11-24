# Salud financiera en México: análisis de la ENSAFI 2023

**Universidad Nacional Autónoma de México · Facultad de Ciencias**
Diplomado "Métodos estadísticos y matemáticos para la ciencia de datos". Módulo I: Proyecto integrador
Prof. M. en C. David Chaffrey Moreno Fernández

**Equipo:** Benavides Esquivel Luis Ángel · Hernández Álvarez Miriam Fernanda · Pineda Pineda Pablo · Ramírez Martínez Rubén

---

## Objetivo

Analizar, con los microdatos de la **Encuesta Nacional sobre Salud Financiera (ENSAFI) 2023** del INEGI, cómo maneja su dinero la población adulta en México, cómo percibe su situación financiera y qué factores se asocian con ella. El trabajo tiene **alcance descriptivo e inferencial**. Todas las cifras se ponderan con los factores de expansión oficiales y **no se hacen afirmaciones causales**.

El notebook incluye:

1. **Análisis exploratorio (EDA):** estructura de las cuatro tablas, llaves de unión, valores especiales ("No sabe"), valores nulos frente a saltos del cuestionario, vivienda, hogar, sociodemografía, ingreso, ahorro, deuda, estrés financiero, metas y diferencias geográficas.
2. **Pregunta 1:** entre las personas adultas con algún préstamo informal o crédito formal, ¿cómo varía la prevalencia de **atrasos en los pagos** según su socialización financiera, su percepción de endeudamiento, su confianza financiera y su escolaridad?
3. **Pregunta 2:** relación entre los **hábitos financieros** (llevar registro de ingresos y gastos), las **experiencias educativas** y la **capacidad de ahorro**, con diferencias de proporciones que toman en cuenta el diseño muestral complejo, corrección de Holm y análisis de sensibilidad.
4. **Pregunta 3:** **bienestar financiero** según la **tenencia de la vivienda** (propia pagada, hipotecada, rentada o prestada), con estadísticas ponderadas y prueba de Kruskal-Wallis.

## Estructura del repositorio

```
.
├── README.md                 ← este archivo
├── CONTRIBUCIONES.md         ← registro de contribuciones del equipo
├── requirements.txt          ← dependencias de Python
├── data/
│   ├── README.md             ← fuente, cómo descargar los datos y licencia
│   ├── TVIVIENDA.csv         ← viviendas          (20,201 × 36)
│   ├── THOGAR.csv            ← hogares            (20,448 × 55)
│   ├── TSDEM.csv             ← personas del hogar (67,781 × 25)
│   └── TMODULO.csv           ← persona elegida    (20,448 × 253)
└── notebooks/
    ├── ENSAFI_EDA_final.ipynb      ← análisis completo (código, resultados e interpretación)
    └── salidas/              ← figuras y tablas que genera el notebook
        ├── eda/              ← 34 figuras del análisis exploratorio
        ├── pregunta_1/       ← figuras 1 a 4
        ├── pregunta_2/       ← 8 figuras y 3 tablas CSV (inferencia y sensibilidad)
        └── pregunta_3/       ← 4 figuras
```

## Cómo reproducir el análisis

**Requisitos:** Python 3.10 o superior y aproximadamente 1 GB de RAM libre. La ejecución completa tarda menos de un minuto.

```bash
# 1. Clonar el repositorio
git clone https://github.com/<usuario>/<repositorio>.git
cd <repositorio>

# 2. Crear un entorno virtual e instalar dependencias
python -m venv .venv
source .venv/bin/activate          # Windows: .venv\Scripts\activate
pip install -r requirements.txt

# 3a. Abrir el notebook y ejecutar todas las celdas en orden (Kernel → Restart & Run All)
jupyter notebook notebooks/ENSAFI_EDA.ipynb

# 3b. O ejecutarlo completo desde la terminal, sin abrirlo
jupyter nbconvert --to notebook --execute --inplace notebooks/ENSAFI_EDA.ipynb
```

Las figuras y tablas se regeneran en `notebooks/salidas/`.

**Notas importantes**

* Ejecuten las celdas **en orden, de arriba abajo**: las preguntas 1 a 3 reutilizan las tablas cargadas en la sección "1. Carga de datos".
* Los datos ya vienen incluidos en `data/`. Si se borran, se pueden volver a descargar siguiendo [`data/README.md`](data/README.md).
* **Google Colab:** suban los cuatro CSV al panel de archivos (o a una carpeta `data/`) y ejecuten todo. El notebook localiza los archivos automáticamente.
* Los resultados son **deterministas**: el remuestreo de la pregunta 3 usa `np.random.seed(42)`, y los intervalos *bootstrap* de `sns.pointplot` usan `seed=42`.


## Datos y licencia

Fuente: INEGI, *Encuesta Nacional sobre Salud Financiera (ENSAFI) 2023*, <https://www.inegi.org.mx/programas/ensafi/2023/>. Los datos se redistribuyen conforme a los [Términos de Libre Uso de la Información del INEGI](https://www.inegi.org.mx/inegi/terminos.html), con atribución a la fuente. Los detalles están en [`data/README.md`](data/README.md).


