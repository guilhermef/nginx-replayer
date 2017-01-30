FROM nginx:alpine

ENV PRIMARY_SERVER localhost:6969
ENV SECONDARY_SERVER localhost:6970


COPY nginx.conf /etc/nginx/nginx.conf
COPY default.template /etc/nginx/conf.d/default.template
RUN envsubst '$PRIMARY_SERVER $SECONDARY_SERVER'< /etc/nginx/conf.d/default.template > /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
