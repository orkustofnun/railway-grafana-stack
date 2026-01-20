#!/bin/bash
set -e

# Check environment variables
if [ -z "$PG_USER" ] || [ -z "$PG_PASSWORD" ]; then
  echo "ERROR: PG_USER or PG_PASSWORD not set"
  exit 1
fi

# Create htpasswd for Nginx
htpasswd -b -c /etc/nginx/.htpasswd "$PG_USER" "$PG_PASSWORD"

# Start Pushgateway on port 9090
/bin/pushgateway --web.listen-address=":9090" &

# Start Nginx in the foreground
nginx -g 'daemon off;'
