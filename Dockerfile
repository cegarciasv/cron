[cite_start]FROM php:8.2-apache [cite: 1]

# Instalar extensiones PHP necesarias (ejemplo, si se necesitaran)
# RUN docker-php-ext-install mysqli pdo pdo_mysql

# Ajustes personalizados de PHP para subida de archivos y errores
RUN { \
    echo 'upload_max_filesize=10M'; \
    echo 'post_max_size=12M'; \
    echo 'display_errors=On'; \
    echo 'display_startup_errors=On'; \
    echo 'error_reporting=E_ALL'; \
[cite_start]} >> /usr/local/etc/php/conf.d/custom.ini [cite: 1]

# Copiar los archivos de la aplicación al directorio del servidor web
[cite_start]COPY public/ /var/www/html/ [cite: 1]

# Crear el directorio de subidas si no existe y establecer permisos
[cite_start]RUN mkdir -p /var/www/html/uploads && chown -R www-data:www-data /var/www/html/uploads [cite: 1]

# Exponer el puerto 80
[cite_start]EXPOSE 80 [cite: 1]

# Comando para iniciar Apache en primer plano
[cite_start]CMD ["apache2-foreground"] [cite: 1]