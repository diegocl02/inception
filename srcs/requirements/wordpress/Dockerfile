# Use the official Alpine Linux image as the base image
FROM alpine:latest

# Set the working directory
WORKDIR /var/www/html

# Install necessary packages and PHP extensions
RUN apk update && \
    apk add --no-cache \
    php \
    php-fpm \
    php-mysqli \
    php-gd \
    php-curl \
    php-opcache \
    php-json \
    curl \
    zip \
    libpng-dev \
    libjpeg-turbo-dev

# Download and extract the latest WordPress
RUN curl -o wordpress.tar.gz https://wordpress.org/latest.tar.gz && \
    tar -xzf wordpress.tar.gz --strip-components=1 && \
    rm wordpress.tar.gz

# Set the correct permissions
# RUN chown -R nobody:nobody /var/www/html

# Copy PHP-FPM configuration file
COPY php-fpm.conf /etc/php81/php-fpm.d/www.conf

# Expose the listening port
EXPOSE 9000

# Start the PHP-FPM service
CMD ["/usr/sbin/php-fpm81", "-F"]