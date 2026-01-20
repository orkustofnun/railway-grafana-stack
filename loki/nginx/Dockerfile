FROM nginx:alpine

# Make env var available to nginx
ENV LOKI_API_TOKEN=""

# Copy template
COPY nginx.conf.template /etc/nginx/nginx.conf.template

# Substitute env vars at startup and run nginx
CMD envsubst '$LOKI_API_TOKEN' \
  < /etc/nginx/nginx.conf.template \
  > /etc/nginx/nginx.conf \
  && nginx -g 'daemon off;'
