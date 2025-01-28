<h1 align="center">SpotiClone</h1> <p align="center"> <img src="./images/spoticlone.jpeg" width="200" alt="Spotify Logo"> </p>
##📱 Brief del proyecto

- Cliente: TechMusic Inc.
- Proyecto: desarrollo de un clon de Spotify (SpotiClone)
- Plazo: desarrollo iterativo en 3 sprints

## 🎶 Contexto musical actual

TechMusic Inc. nos ha contratado para desarrollar una **versión simplificada de una aplicación de streaming musical**, similar a Spotify. El cliente busca una aplicación que pueda crecer y evolucionar con el tiempo, comenzando con funcionalidades básicas e incorporando características más avanzadas en futuras iteraciones.

El mercado de streaming musical está en constante crecimiento, y **TechMusic Inc. quiere entrar en este sector con una aplicación robusta y escalable**. Han elegido <span style="color: orange">**Swift**</span> como lenguaje de desarrollo por su rendimiento y capacidades modernas.

## 🚀 El desafío

Desarrollar una aplicación de música que permita a los usuarios gestionar y reproducir música, sea escalable y mantenible, y evolucione junto con las necesidades del usuario. Cada vez que se añada una funcionalidad, es necesario revisar lo anterior para que el programa sea coherente.

## 📋 Requisitos técnicos iniciales 

En esta primera fase, necesitamos implementar las funcionalidades core utilizando los siguientes conceptos de Swift:

- Variables y constantes
- Funciones y métodos
- Estructuras de control y bucles
- Enumeraciones
- Colecciones (Arrays, Sets, Diccionarios)
- Tuplas
- Control de flujo y condiciones
- Precondiciones
- Opcionales
- Structs


### Fuente de datos

El archivo JSON proporcionado contiene una colección de canciones con información detallada estructurada en dos niveles:

El primer nivel es el array de canciones:

```json
{
  "songs": [ ... ]  // Array de canciones
}
```

El segundo nivel corresponde a cada una de las canciones:

```json
    {
      // Identificador único de la canción
      "id": "unique_id",

      // Información básica de la canción
      "basicInfo": {
        "title": "Song Name",        // Título de la canción
        "artist": "Artist Name",     // Nombre del artista
        "duration_ms": 234000,       // Duración en milisegundos (ej: 234000ms = 3:54 min)
        "genre": "Pop",              // Género musical
        "album": "Album Name",       // Nombre del álbum
        "releaseDate": "2023-01-01", // Fecha de lanzamiento (YYYY-MM-DD)
        "isExplicit": false          // Indica si tiene contenido explícito
      },

      // Información técnica musical
      "technicalInfo": {
        "bpm": 120,                  // Beats por minuto (tempo)
        "key": "C",                  // Tonalidad musical (ej: C, Am, F#)
        "isrc": "USX123456789"       // Código único internacional de grabación (12 caracteres)
      },

      // Metadatos y información adicional
      "metadata": {
        "tags": [                    // Array de etiquetas descriptivas
          "summer",
          "dance",
          "remix"
        ],
        "language": "en",           // Idioma de la canción
        "popularity": 85            // Índice de popularidad (0-100)
      }
    }
```

## 🌟 Familiarización con el proyecto 

Para este primer momento, se requiere programar una manera para realizar las siguientes operaciones:

### Búsquedas y filtrados básicos

1. Obtener todas las canciones de un artista específico
2. Obtener todas las canciones de un género determinado
3. Encontrar canciones que duren más de X minutos
4. Obtener canciones lanzadas en un año específico
5. Listar canciones por tag
6. Listar canciones que duren menos de tres minutos
7. Listar canciones que duren más de tres minutos
8. Listar canciones donde las canciones de diferentes duraciones estén mezcladas de manera aleatoria

El orden de las canciones no importa a no ser que se especifique lo contrario

### Cálculos y estadísticas

1. Calcular la duración total del catálogo en minutos
2. Obtener la duración promedio de las canciones
3. Calcular hace cuánto se publicó una canción según su nombre
4. Encontrar la canción más larga y más corta
5. Calcular el promedio de popularidad de todas las canciones
6. Contar cuántas canciones hay por género
7. Obtener el álbum con mayor número de canciones

### Validaciones complejas

1. Comprobar si existen canciones que cumplan las condiciones género X, año Y
2. Encontrar canciones por rango de BPM
3. Listar todos los tags que existan en el catálogo
4. Comprobar si existen canciones para todas las tonalidades. Si no existen, obtener las tonalidades faltantes



## ✔️ Tareas 

### 🎵 Reproductor Spoticlone

El alma de todo reproductor de música son las playlists, que siempre tendrán un nombre y que deberá ser único. Sin las playlist, tendríamos que reproducir las canciones de una en una, algo que no le desearíamos ni a nuestro peor enemigo. Por eso, el SpoticlonePlayer tiene que tener las siguientes funcionalidades:

- **Añadir canciones** de una en una
- **Añadir canciones** en un pack de canciones
- **Eliminar canciones** de una en una
- **Eliminar canciones** de muchas en muchas
- **Obtener número total de canciones**
- **Vaciar playlist**: posibilidad de eliminar todas las canciones de la playlist de golpe
- **Mezclar la lista** de manera aleatoria
- **Obtener la lista invertida**, es decir, orden inverso al que se han ido añadiendo
- **Ordenar la lista por fecha de publicación**

Nuestro programa debe

- Reproducir canciones desde una lista, mostrando cada canción por consola cada cierto tiempo
  - **Intervalo por defecto:** 5 segundos
  - **Personalizable:** El DJ puede decidir el número de segundos a esperar entre canción y canción
- Detenerse una vez que se hayan reproducido todas las canciones, mostrando un último mensaje personalizable por el DJ que indique que ya no hay más canciones disponibles

Además, la lista debe poder reproducirse de las siguientes maneras:

1. De inicio a fin (orden por defecto en que se han añadido las canciones)
2. De manera aleatoria
3. Desde el final hasta el principio

También, debe ser posible cambiar el orden de reproducción según los siguientes criterios:

- **Por antigüedad de las canciones:** fecha de publicación más reciente primero
- **Por clasificación de tonalidad musical:** (no hay tonalidades menores)
  - De la C (Do) a la B (Si) (C → D → E → F → G → A → B)
  - Bemol (♭) antes de la tonalidad y sostenido (♯) después
    - Ejemplos: Db → D → E → E♯
- **Por nivel de popularidad:**
  - Orden descendente
  - Orden ascendente
- **Por BPM.**
  - Orden descendente

En el momento en el que se inicia la reproducción de la lista, se requiere que **se imprima por consola el modo de reproducción**.

### 🎧 Estilos de los DJs

Para las mezclas, es ideal utilizar canciones que tengan una afinidad y estilos que concuerden. Todos los DJ quieren tener dos funcionalidades: 

- Crear una **lista de tags únicos** donde cada tag aparezca una única vez
- Acceso por tag: dado un **tag**, acceder a una **lista de canciones** que lo compartan
- Cada DJ tiene **un estilo** diferente, según su estilo, el programa tiene que revelar las **canciones que más le convengan**
- Si un DJ no se identifica con un único estilo, debe ser posible **elegir hasta 2 estilos** para crear una lista con canciones compatibles.


Los estilos de los DJ son los siguientes:

*DJ Chill Vibes*

- **Descripción:** canciones relajantes y suaves para crear un ambiente tranquilo.
- **Tags sugeridas:** chill, soulful, acoustic, memories, soft rock, nostalgic, peace.

*DJ Party Starter*

- **Descripción:** centrado en levantar el ánimo y sacar a la gente a bailar.
- **Tags sugeridas:** party, dance, energetic, disco, summer, fun, uplifting, catchy.

*DJ Rock Anthems*

- **Descripción:** ideal para apasionados del rock y el heavy, tanto clásico como moderno.
- **Tags sugeridas:** rock, hard rock, power ballad, anthem, epic, alternative, angry.

*DJ Emotional Trip*

- **Descripción:** diseñado para conectar emocionalmente con la audiencia. Canciones con mensajes profundos y melancólicos.
- **Tags sugeridas:** emotional, heartbreak, melancholic, regret, nostalgia, reflective, romantic.

*DJ Energy Boost*

- **Descripción:** perfecto para motivar y energizar a una multitud sin importar la hora del día.
- **Tags sugeridas:** motivational, inspiration, freedom, empowerment, upbeat, heroic, power.

*DJ 80's Lovers*

- **Descripción:** para aquellos amantes del synth, el pop retro y la nostalgia de los años 80.
- **Tags sugeridas:** 80s, synthwave, pop, iconic, retro.


### 🎯 Objetivo de Spoticlone

El objetivo de Spoticlone es mejorar el algoritmo de descubrimiento Spotify, así que queremos trabajar desde el inicio en ello. El primer paso es comprender cómo se relacionan las canciones con respecto a ciertas propiedades como

- Género.
- BPM.
- Tags.
- Tonalidad.
- Popularidad.

Con esta relación, se pretende obtener el grado de similitud entre dos canciones, información que los DJs podrán usar para sus mezclas.

#### Género

Por ahora, las pruebas se están haciendo con los géneros **Dance-Pop, Indie Rock, Alternative Rock, Pop, Soundtrack, Pop-Rock, Indie-Pop, Rock, Indie, Industrial Rock, R&B, Soul, Disco, Hip-Hop, Electropop, Britpop**. Estos, están relacionados por similitud en el siguiente diccionario de relaciones:

```Swift
[
    // Pop y derivados
    "Pop": ["Dance-Pop", "Pop-Rock", "Indie-Pop", "Electropop"],
    "Dance-Pop": ["Pop", "Electropop", "Disco"],
    "Pop-Rock": ["Pop", "Rock", "Indie-Pop"],
    "Electropop": ["Pop", "Dance-Pop", "Industrial Rock"],
    "Indie-Pop": ["Pop", "Pop-Rock", "Indie"],
    "Britpop": ["Pop", "Rock", "Indie"],

    // Rock y derivados
    "Rock": ["Pop-Rock", "Indie Rock", "Alternative Rock"],
    "Indie Rock": ["Rock", "Alternative Rock", "Indie"],
    "Alternative Rock": ["Rock", "Indie Rock", "Industrial Rock"],
    "Industrial Rock": ["Alternative Rock", "Electropop"],
    "Indie": ["Indie Rock", "Indie-Pop", "Britpop"],

    // R&B y géneros relacionados
    "R&B": ["Soul", "Hip-Hop"],
    "Soul": ["R&B", "Disco"],
    "Hip-Hop": ["R&B", "Dance-Pop"],
    "Disco": ["Dance-Pop", "Soul"],

    // Otros
    "Soundtrack": ["Orchestral", "Pop", "Rock"] // Género versátil que puede relacionarse con varios
]
```

La similitud del **género** contribuye con un máximo de **25 puntos** al cómputo global de similitud:

- Una similitud del **100%** contribuiría con **25 puntos** (100% de 25)
    - Ejemplo: Pop - Pop
- Un género de **primer nivel** contaría como **17.5 puntos** (70% de 25)
    - Ejemplo: Pop - Dance-Pop
- Un género de **segundo nivel** tendría la puntuación del **10 puntos** (40% de 25)
    - Ejemplo: Pop - Disco, porque Pop está relacionado con Dance-Pop, que a su vez está relacionado con Disco
- Los géneros de tercer nivel y siguientes no cuentan

En lo que respecta a los **BPM (Beats Per Minute)**, este contribuye con un máximo de **20 puntos** al cómputo global de similitud. La puntuación se calcula según la diferencia de BPM entre las dos canciones:

- Una diferencia de **menos de 10 BPM** contribuiría con **20 puntos** (100% de 20)
    - Ejemplo: BPM1 = 120, BPM2 = 128 (diferencia de 8)
    - Ejemplo: BPM1 = 100, BPM2 = 95 (diferencia de 5)

- Una diferencia **entre 10 y 19 BPM** contribuiría con **15 puntos** (75% de 20)
    - Ejemplo: BPM1 = 120, BPM2 = 135 (diferencia de 15)
    - Ejemplo: BPM1 = 100, BPM2 = 115 (diferencia de 15)

- Una diferencia **entre 20 y 29 BPM** contribuiría con **10 puntos** (50% de 20)
    - Ejemplo: BPM1 = 120, BPM2 = 145 (diferencia de 25)
    - Ejemplo: BPM1 = 100, BPM2 = 128 (diferencia de 28)

- Una diferencia **entre 30 y 39 BPM** contribuiría con **5 puntos** (25% de 20)
    - Ejemplo: BPM1 = 120, BPM2 = 155 (diferencia de 35)
    - Ejemplo: BPM1 = 100, BPM2 = 138 (diferencia de 38)

- Una diferencia de **40 BPM o más** no contribuiría con **0 puntos** (0% de 20)
    - Ejemplo: BPM1 = 120, BPM2 = 170 (diferencia de 50)
    - Ejemplo: BPM1 = 100, BPM2 = 145 (diferencia de 45)

Esta escala se ha diseñado considerando que

- Canciones con BPM muy similares (diferencia < 10) son fácilmente mezclables
- Diferencias moderadas (10-30) todavía permiten transiciones suaves
- Diferencias grandes (> 40) hacen que la mezcla sea más compleja y menos natural

#### Etiquetas

Los **tags** contribuyen con un **máximo de 30 puntos** al cómputo global de similitud. La puntuación se calcula según la proporción de tags compartidos respecto al número máximo de tags entre las dos canciones:

**La fórmula es: (número de tags comunes / máximo número de tags entre las dos canciones) * 30**

- **Coincidencia total (100% = 30 puntos):**  
  - Canción 1: `["dance", "summer", "pop"]`  
  - Canción 2: `["dance", "summer", "pop"]`  
    - Tags comunes: 3  
    - Máximo de tags: 3  
    - Ratio: 3/3 = 1  
    - **Puntuación:** 1 * 30 = **30 puntos**

- **Coincidencia alta (66.67% = 20 puntos):**  
  - Canción 1: `["dance", "summer", "pop"]`  
  - Canción 2: `["dance", "summer", "rock"]`  
    - Tags comunes: 2  
    - Máximo de tags: 3  
    - Ratio: 2/3 = 0.667  
    - **Puntuación:** 0.667 * 30 = **20 puntos**

- **Coincidencia media (50% = 15 puntos):**  
  - Canción 1: `["dance", "summer"]`  
  - Canción 2: `["dance", "summer", "rock", "energetic"]`  
    - Tags comunes: 2  
    - Máximo de tags: 4  
    - Ratio: 2/4 = 0.5  
    - **Puntuación:** 0.5 * 30 = **15 puntos**

- **Coincidencia baja (33.33% = 10 puntos):**  
  - Canción 1: `["dance", "summer", "pop"]`  
  - Canción 2: `["dance", "rock", "angry"]`  
    - Tags comunes: 1  
    - Máximo de tags: 3  
    - Ratio: 1/3 = 0.333  
    - **Puntuación:** 0.333 * 30 = **10 puntos**

- **Sin coincidencia (0% = 0 puntos):**  
  - Canción 1: `["dance", "summer", "pop"]`  
  - Canción 2: `["rock", "angry", "metal"]`  
    - Tags comunes: 0  
    - Máximo de tags: 3  
    - Ratio: 0/3 = 0  
    - **Puntuación:** 0 * 30 = **0 puntos**


**Casos especiales:**

- Si una canción no tiene tags, la puntuación será 0
- Si ambas canciones tienen exactamente los mismos tags, independientemente del número, obtendrán la puntuación máxima de 30 puntos
- El orden de los tags no afecta a la puntuación
- Los tags son case-sensitive, por lo que "Dance" y "dance" se considerarían diferentes
- No es una escala lineal, sino que va por tramos


#### Tonalidad

Aunque de momento nuestro catálogo solo cuenta con canciones en las siguientes tonalidades: **D, F♯, A, E, C♯, B, C, D♯, A♯, G, D♭, G♯, F,** las tonalidades musicales forman parte de los fundamentos de la armonía, que en la cultura occidental sigue ciertos patrones. Los patrones más básicos son la relación de **tónica, subdominante y dominante** de una tonalidad, que se representan a continuación:

```Swift
	[
        "C": ["G", "F", "Am"],
        "C#": ["G#", "F#", "A#m"],
        "Db": ["Ab", "Gb", "Bbm"],
        "D": ["A", "G", "Bm"],
        "D#": ["A#", "A", "Cm"],
        "Eb": ["Bb", "Ab", "Cm"],
        "E": ["B", "A", "C#m"],
        "F": ["C", "Bb", "Dm"],
        "F#": ["C#", "B", "D#m"],
        "Gb": ["Db", "B", "Ebm"], 
        "G": ["D", "C", "Em"],
        "G#": ["D#", "D", "Fm"],
        "Ab": ["Eb", "Db", "Cm"],
        "A": ["E", "D", "F#m"],
        "A#": ["F", "E", "Gm"],
        "Bb": ["F", "Eb", "Gm"],
        "B": ["F#", "E", "G#m"]
    ]

```

- **Tonalidades idénticas (100% = 15 puntos):**  
  - Ejemplo 1: key1 = `"C"`, key2 = `"C"`  
  - Ejemplo 2: key1 = `"Am"`, key2 = `"Am"`  
  - Ejemplo 3: key1 = `"F#"`, key2 = `"F#"`  

- **Tonalidades armónicamente relacionadas (70% = 10.5 puntos):**  
  - Ejemplo 1: key1 = `"C"`, key2 = `"G"`  
    (Sol es la dominante de Do)  
  - Ejemplo 2: key1 = `"C"`, key2 = `"F"`  
    (Fa es la subdominante de Do)  
  - Ejemplo 3: key1 = `"C"`, key2 = `"Am"`  
    (La menor es el relativo menor de Do)  

- **Tonalidades sin relación armónica (0 puntos):**  
  - Ejemplo 1: key1 = `"C"`, key2 = `"B"`  
    (No hay relación armónica directa)  
  - Ejemplo 2: key1 = `"F"`, key2 = `"E"`  
    (No hay relación armónica directa)  


#### Popularidad

Por último, la **popularidad** contribuye con un **máximo de 10 puntos** al cómputo global de similitud. La puntuación se calcula según la diferencia absoluta entre los índices de popularidad de las dos canciones, donde cada canción tiene un valor de popularidad entre 0 y 100.

**La fórmula es: 10 * (1 - (diferencia_popularidad / 100))**

- **Diferencia mínima (10 puntos = 100% de 10):**  
  - Canción 1: popularidad = 85  
  - Canción 2: popularidad = 85  
    - Diferencia: |85 - 85| = 0  
    - Ratio: 1 - (0/100) = 1  
    - **Puntuación:** 10 * 1 = **10 puntos**

- **Diferencia pequeña (7.5 puntos = 75% de 10):**  
  - Canción 1: popularidad = 80  
  - Canción 2: popularidad = 55  
    - Diferencia: |80 - 55| = 25  
    - Ratio: 1 - (25/100) = 0.75  
    - **Puntuación:** 10 * 0.75 = **7.5 puntos**

- **Diferencia media (5 puntos = 50% de 10):**  
  - Canción 1: popularidad = 90  
  - Canción 2: popularidad = 40  
    - Diferencia: |90 - 40| = 50  
    - Ratio: 1 - (50/100) = 0.5  
    - **Puntuación:** 10 * 0.5 = **5 puntos**

- **Diferencia grande (2.5 puntos = 25% de 10):**  
  - Canción 1: popularidad = 95  
  - Canción 2: popularidad = 20  
    - Diferencia: |95 - 20| = 75  
    - Ratio: 1 - (75/100) = 0.25  
    - **Puntuación:** 10 * 0.25 = **2.5 puntos**

- **Diferencia máxima (0 puntos = 0% de 10):**  
  - Canción 1: popularidad = 100  
  - Canción 2: popularidad = 0  
    - Diferencia: |100 - 0| = 100  
    - Ratio: 1 - (100/100) = 0  
    - **Puntuación:** 10 * 0 = **0 puntos**

**Características importantes**

1. La puntuación es simétrica (no importa qué canción tiene mayor popularidad)
2. La escala es lineal (cada punto de diferencia tiene el mismo peso)
3. El rango de popularidad debe estar normalizado (0-100)
4. La puntuación nunca es negativa, en ese caso, la compatibilidad será de 0

**Casos especiales**

- Si alguna canción no tiene valor de popularidad, se asume 0.
- Los valores de popularidad fuera del rango 0-100 deberían ser normalizados.
- La diferencia se calcula siempre en valor absoluto.

### 📊 Entregables esperados

- Código fuente comentado y documentado
- Tests unitarios básicos
- Documentación de las funcionalidades implementadas
- Propuesta de mejoras para futuros sprints




