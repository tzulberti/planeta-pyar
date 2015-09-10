Ésta es la configuración que genera, mediante [`nikola`](https://getnikola.com/) y otras dependencias, los sitios
http://planeta.python.org.ar/ y http://planeta.python.org.ar/python/.

Agregar tu propio blog
======================

Hacenos un Pull Request modificando el archivo `full/feeds` y eventualemnte también `solopython/feeds`. El primero es
para que agregues el feed de todo tu blob y el segundo para el feed de sólo la sección dedicada a Python, si llegaras
a tenerla. ¡Si no la tienes, no te agregues a ese archivo! 

El formato es muy sencillo: una línea en blanco, una línea con el URL del archivo `RSS` o `Atom`, y una línea con el
nombre o nick con el que van a aparecer tus posts. Si agregas un nick, es mejor si además agregas tu nombre en un 
comentario antes.

La forma más fácil de hacerlo es simplemente usar la interfaz misma de GitHub: 

https://github.com/PyAr/planeta-pyar/edit/master/full/feeds

https://github.com/PyAr/planeta-pyar/edit/master/solopython/feeds

Cuando envíes los cambios, asegúrate de seleccionar «Create a new branch for this commit and start a pull request»; de
esa forma se van a autogenerar un PR por archivo.

Instalación
===========

En relalidad no necestiás instalalro para agregar tu blog, pero si realmente te interesa (o querés ayudarnos a
manternelo), el procedimiento es simple:

    # Sugerimos el uso de virtualenv
    virtualenv .
    # Activar el virtualenv
    source bin/activate
    # Instalar dependencias
    pip install -r requirements.txt

En teoría eso es todo, peor pueden pasar varias cosas.

Primero, algunas dependencias requieren de paquetes de desarrollo para compilar (son extenciones en C):

* `lxml` depende de `libxml2-dev` y `libxslt-dev` o similar.
* `Pillow` depende de `libfreetype-dev` o similar.

Es posible que aún después de haber instalado esas dependencias, la compilación no encuentre los encabezados (archivos
`.h`) y falle con errores del tipo:

    /tmp/pip-build-h3Nq3m/lxml/src/lxml/includes/etree_defs.h:9:31: fatal error: libxml/xmlversion.h: No such file or directory

Para salir del paso se pueden usar las variables de entorno `CFLAGS` y `LDFLAGS`, por ejemplo:

    export CFLAGS='-I/usr/include/libxml2'
    export LDFLAGS='-L/usr/include/libxml2'

Segundo, parece haber un bug en versiones viejas de `pip`, que se queda de que:

    DistributionNotFound: No distributions matching the version for configparser==3.3.0r2

Esto se resuelve instalando una versión nueva de `pip`:

    pip install pip -U
