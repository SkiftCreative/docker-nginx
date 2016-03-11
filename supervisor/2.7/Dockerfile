FROM skiftcreative/supervisor:2.7
MAINTAINER Shawn McElroy <shawn@skift.io>

RUN apk add --no-cache nginx && \
    rm -f /etc/nginx/nginx.conf

ADD nginx.conf /etc/nginx/nginx.conf
ADD supervisord.conf /etc/supervisor/conf.d/nginx.conf

EXPOSE 80
