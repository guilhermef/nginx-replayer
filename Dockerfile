FROM nginx:alpine

ENV PRIMARY_SERVER 10.0.23.0:6969
ENV SECONDARY_SERVER 10.0.23.0:6970


COPY nginx.conf /etc/nginx/nginx.conf
COPY default.template /etc/nginx/conf.d/default.template
RUN envsubst < /etc/nginx/conf.d/default.template > /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
