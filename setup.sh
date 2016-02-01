#!/bin/bash

sed -i -e "s/{{server_name}}/${SERVER_NAME}/g" /etc/nginx/sites-enabled/default
