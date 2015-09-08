Ésta es la configuración que genera, mediante [`nikola`](https://getnikola.com/) y otras dependencias, los sitios
http://planeta.python.org.ar/ y http://planeta.python.org.ar/python/.

Agregar tu propio blog
======================

Hacenos un Pull Request modificando el archivo `full/feeds` y eventualemnte también `solopython/feeds`. El formato es
muy sencillo: una línea en blanco, una línea con el URL del archivo `RSS` o `Atom`, y una línea con el nombre o nick
con el que va a aparecer tus posts.

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
