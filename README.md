# Filtros para imagenes y videos

## Integrantes
* Juan David Quintero P.

## Objetivos
Implementar filtros con el objetivo de cambiar la calidad de la imagen o el video.

## Descripción del desarrollo
Implementación de como cargar una imagen y video en processing, luego a partir de la teoría hacemos los filtros en los archivos glsl, donde recibimos la posición del pixel y el número de vecinos para determinar que tanta profundidad aplicaremos del filtro en la imagen y/o video.

**Nota:** El número de vecinos son los pixeles alrededor del pixel actual donde estoy ubicado como en la siguiente imagen:



Cada una de las posiciones de la imagen o el video a las que se hará la transformación del filtro se almacenan en una matriz, la cual se multiplicara con el kernel posición a posición, y se guardara en una variable acumuladora, y esa el valor de esa variable se le asignara al pixel actual para que quede con el filtro.

## Discución de resultados
Dentro de este trabajo se pretende implementar los filtros básicos para imagenes y videos, en donde se pueden obtener filtros mejores siempre y cuando el parametro de los vecinos sea mayor, pero así también el consumo por parte de CPU y bastante mayor.


## Referencias
* http://lodev.org/cgtutor/filtering.html
* http://setosa.io/ev/image-kernels/
* https://en.wikipedia.org/wiki/Kernel_(image_processing)