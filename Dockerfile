FROM php:8.2-apache

# Ajustes personalizados
RUN { \
    echo 'upload_max_filesize=10M'; \
    echo 'post_max_size=12M'; \
    echo 'display_errors=On'; \
} >> /usr/local/etc/php/conf.d/custom.ini

COPY public/ /var/www/html/

RUN chown -R www-data:www-data /var/www/html/uploads || true

EXPOSE 80

CMD ["apache2-foreground"]
