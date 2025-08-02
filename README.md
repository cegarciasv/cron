# PHP Test App para EasyPanel y Docker

## Qué incluye

- `public/index.php`: Página principal que muestra `phpinfo()` y un formulario de subida.
- `public/upload.php`: Procesa la subida de archivos y los guarda en `public/uploads`.
- `Dockerfile`: Imagen basada en `php:8.2-apache` con ajustes de subida y errores activados.
- `docker-compose.yml`: Ejemplo para levantar el contenedor con mapeo de puerto y volumen.

## Cómo probar

1. Construir la imagen:
   ```bash
   docker build -t php-test-app .
   ```

2. Correr el contenedor:
   ```bash
   docker run -d --name prueba-php -p 8080:80 php-test-app
   ```

   O con Compose:
   ```bash
   docker compose up -d
   ```

3. Abrir en navegador: `http://<IP_DEL_SERVIDOR>:8080/`

4. Subir un archivo y verificar que se guarde en `/var/www/html/uploads` dentro del contenedor:
   ```bash
   docker exec -it prueba-php ls -la /var/www/html/uploads
   ```

## Notas

- Si modificas archivos y usas `docker run`, debes reconstruir:
  ```bash
  docker build -t php-test-app . && docker stop prueba-php && docker rm prueba-php
  docker run -d --name prueba-php -p 8080:80 php-test-app
  ```

- EasyPanel puede consumir esta imagen directamente si le das acceso al Dockerfile o construyes manualmente y la registras.

