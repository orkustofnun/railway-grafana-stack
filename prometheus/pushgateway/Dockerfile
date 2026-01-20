# Stage 1: Pull Pushgateway
FROM prom/pushgateway:latest AS pushgateway

# Stage 2: Nginx + Pushgateway
FROM nginx:alpine

# Install utilities needed for htpasswd and bash
RUN apk add --no-cache apache2-utils bash

# Copy Nginx config
COPY nginx/nginx.conf /etc/nginx/conf.d/default.conf

# Copy Pushgateway binary from previous stage
COPY --from=pushgateway /bin/pushgateway /bin/pushgateway

# Copy entrypoint script and make it executable
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Expose the port Nginx listens on
EXPOSE 9091

# Run entrypoint script directly
ENTRYPOINT ["/entrypoint.sh"]
