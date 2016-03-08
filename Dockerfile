FROM skiftcreative/supervisor:3.3-alpine
MAINTAINER Shawn McElroy <shawn@skift.io>

RUN apk add --no-cache nginx

# run in daemon mode
RUN echo "daemon off;" >> /etc/nginx/nginx.conf


# update the server name
# RUN sed -i -e \
    # "s/{{server_name}}/${SERVER_NAME}/g" \
    # /etc/nginx/sites-enabled/default

COPY supervisor/supervisord.conf /etc/supervisor/conf.d/

EXPOSE 80

# the supervisor ancestor image will run nginx and gunicorn
