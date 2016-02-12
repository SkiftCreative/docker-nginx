FROM skiftcreative/gunicorn:latest
MAINTAINER Shawn McElroy <shawn@skift.io>

ENV SERVER_NAME localhost

RUN apt-get update
RUN apt-get install -y nginx
RUN apt-get autoremove -y
RUN apt-get clean -y
RUN rm -rf /var/lib/apt/lists/*

# run in daemon mode
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# add our virtual host
ADD sites-enabled/default /etc/nginx/sites-enabled/default

# update the server name
RUN sed -i -e \
    "s/{{server_name}}/${SERVER_NAME}/g" \
    /etc/nginx/sites-enabled/default

RUN rm -f /etc/nginx/sites-default/default

COPY supervisor/nginx.conf /etc/supervisor/conf.d/

EXPOSE 80

# the supervisor ancestor image will run nginx and gunicorn
