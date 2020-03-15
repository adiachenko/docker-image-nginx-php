FROM nginx:1.17

LABEL maintainer="Alexander Diachenko"

ENV NGINX_BACKEND_HOST ${NGINX_BACKEND_HOST:-php}
ENV NGINX_BACKEND_PORT ${NGINX_BACKEND_PORT:-9000}
ENV NGINX_SERVER_TYPE ${NGINX_SERVER_TYPE:-laravel}

COPY conf.d/ /etc/nginx/conf.d/

WORKDIR /opt/project

CMD envsubst < /etc/nginx/conf.d/default.template > /etc/nginx/conf.d/default.conf && exec nginx -g 'daemon off;'