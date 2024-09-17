# Usamos Alpine como base
FROM alpine:latest

# Instalamos dependencias necesarias
RUN apk add --no-cache \
    bash \
    sudo \
    git \
    curl \
    build-base \
    python3 \
    py3-pip

# Creamos un usuario no-root
RUN adduser -D -u 1000 myuser

# Configuramos sudo para el usuario
RUN echo "myuser ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/myuser

# Cambiamos al usuario no-root
USER myuser

WORKDIR /home/myuser

# Aquí clonaremos o configuraremos AceStream más tarde

# Exponemos el puerto de AceStream (ajustar más adelante)
EXPOSE 6878/tcp

# Comando por defecto (ajustar más adelante)
CMD ["/bin/bash"]

