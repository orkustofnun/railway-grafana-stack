FROM nginx:alpine

# Make env var available to nginx
ENV LOKI_API_TOKEN=""

# Copy template
COPY nginx.conf /etc/nginx/nginx.conf

# Substitute env vars at startup and run nginx
CMD envsubst '$LOKI_API_TOKEN' \
  < /etc/nginx/nginx.conf \
  > /etc/nginx/nginx.conf.processed \
  && mv /etc/nginx/nginx.conf.processed /etc/nginx/nginx.conf \
  && nginx -g 'daemon off;'