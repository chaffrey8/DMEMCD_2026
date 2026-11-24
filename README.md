# Movilidad-Urbana-del-Sistema-de-Transporte-CDMX
Análisis de datos sobre movilidad en CDMX: afluencia de pasajeros en Metro, Metrobús y Ecobici, e ingresos históricos del STC Metro


## Alcance 
Repositorio dedicado al análisis de la movilidad urbana y los flujos financieros del transporte público en la Ciudad de México (Metro, Metrobús y Ecobici). Este proyecto busca entender los patrones de desplazamiento ciudadano, la recaudación tarifaria y el uso de alternativas de movilidad sustentable mediante ciencia de datos.

---

## Objetivos de Investigación
- **P1. ¿Cómo se distribuye la afluencia del Metro y del Metrobús por tipo de pago (boleto, prepago y gratuidad), y cómo cambia esa distribución entre líneas, entre días laborales y fines de semana, y a lo largo del tiempo (2021–2026)?**
- **P2. ¿Qué patrones de uso presenta Ecobici en enero de 2026 según género, edad y hora del día, y cómo se comparan con el histórico 2010–2024?**
- **P3. ¿Cómo se relacionan los ingresos del Metro con su afluencia mensual en el periodo en que ambas bases coinciden (enero 2021 – julio 2023)?**


## Fuentes de información
- https://datos.cdmx.gob.mx/
- https://ecobici.cdmx.gob.mx/datos-abiertos/


##  Equipo de Desarrollo
- **Ricardo Martínez Corrales**
- **Juan Ernesto Gallegos Juárez**
- **Isaac Martín Cerón García**
- **Leonardo Guerrero Mendoza**
- **Arantxa Trinidad Alva Pacheco**


## Registro de contribuciones
| Integrante | Aportación |
|---|---|
| Arantxa Trinidad Alva Pacheco | Problemas de calidad y decisiones de limpieza o transformación |
| Ricardo Martínez Corrales | Contexto del problema, descripción de los datos, preguntas de investigación |
| Isaac Martín Cerón García | Manipulación, organización del código y reproducibilidad |
| Leonardo Guerrero Mendoza | Estadística descriptiva y exploración |
| Juan Ernesto Gallegos Juárez | Visualizaciones, hallazgos, conclusiones, limitaciones y líneas futuras |







## Comandos Git de referencia
Para contribuir al proyecto:
1. Clona el repositorio con el comando: `git clone https://github.com/Juan-Gallegos7/Movilidad-Urbana-del-Sistema-de-Transporte-CDMX.git`.
2. Ingresa a la carpeta del proyecto: `cd Movilidad-Urbana-del-Sistema-de-Transporte-CDMX`.
3. Crea una nueva rama para tus cambios: `git branch rama-nombre`.
4. Cambia a tu nueva rama: `git checkout rama-nombre`.

Los comandos más comunes que usarás son:
- `git checkout rama-nombre` para cambiar de rama.
- `git add .` para agregar todos los cambios al próximo commit.
- `git commit -m "Mensaje descriptivo` para hacer un commit con tu mensaje.
- `git push origin rama-nombre` para subir tus cambios al repositorio remoto.


## Instalación de librerías desde `requirements`
En la terminal de VS Code (dentro de la carpeta del proyecto y con tu entorno activo):
```bash
pip install -r requirements_movilidad_cdmx.txt
```


## Cómo reproducir el análisis
1. Clona el repositorio e instala las librerías como se indica arriba. Los datos ya vienen en la carpeta `Datasets/`.
2. Abre `Final_Proyecto_Movilidad_CDMX.ipynb` en Jupyter o VS Code.
3. Ejecuta todas las celdas en orden (**Run All**). El notebook encuentra solo la carpeta `Datasets/`; si los datos están en otro lugar, define la variable de entorno `MOVILIDAD_DATA_DIR` con su ruta.
4. Al terminar, el notebook genera:
   - `data/processed/`: datos limpios y bitácora de limpieza.
   - `data/analitica/`: tablas para el análisis y bitácora de manipulación.
   - `resultados/figuras/` y `resultados/tablas/`: gráficas y tablas de las decisiones de limpieza.
