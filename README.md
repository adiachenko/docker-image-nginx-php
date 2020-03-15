This image is used a reverse proxy for PHP container. For example, using Docker Compose:

```yml
version: '3.7'

services:
  php:
    image: adiachenko/php
    volumes:
      - ./:/opt/project:cached

  nginx:
    depends_on:
      - php
    image: adiachenko/nginx-php
    environment:
      - NGINX_BACKEND_HOST=php
      - NGINX_SERVER_TYPE=laravel
    ports:
      - 8000:80
    volumes:
      - ./:/opt/project:cached
```

Available server types:

- laravel
- symfony
- wordpress

## Creating images

Build images:

```sh
docker build --no-cache -t adiachenko/nginx-php:1.17 .
docker build -t adiachenko/nginx-php:latest .
```

Push images to Docker Hub:

```
docker push adiachenko/nginx-php:1.17
docker push adiachenko/nginx-php:latest
```