FROM buildpack-deps:jessie
MAINTAINER Shawn McElroy <shawn@skift.io>

ENV SERVER_NAME localhost

RUN apt-get update && \
    apt-get install -y nginx && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN echo "daemon off;" >> /etc/nginx/nginx.conf
ADD app/ /app/
ADD sites-enabled/default /etc/nginx/sites-enabled/default
ADD setup.sh /setup.sh
RUN chmod +x /setup.sh

RUN /setup.sh

RUN rm -f /etc/nginx/sites-default/default

EXPOSE 80

CMD ["/usr/sbin/nginx"]
