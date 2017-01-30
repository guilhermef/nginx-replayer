#!/bin/sh
set -e

envsubst '$PRIMARY_SERVER $SECONDARY_SERVER'< /etc/nginx/conf.d/default.template > /etc/nginx/conf.d/default.conf
nginx -g "daemon off;"
