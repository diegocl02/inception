FROM alpine:latest

# Install NGINX and OpenSSL
RUN apk update && \
    apk add --no-cache nginx openssl

# Generate a self-signed SSL certificate
RUN mkdir /etc/nginx/ssl && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt \
    -subj "/C=US/ST=California/L=San Francisco/O=MyOrg/OU=MyUnit/CN=localhost"

# Adding curl for troubleshooting
RUN apk --no-cache add curl

# Copy the NGINX configuration file
# COPY nginx.conf /etc/nginx/nginx.conf

# Expose the NGINX listening port
EXPOSE 443

# Start NGINX
CMD ["nginx", "-g", "daemon off;"]