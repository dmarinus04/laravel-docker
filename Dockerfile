# Set the base image to PHP 8.1 with Apache
FROM php:8.4-fpm

# Install dependencies (thanks hylke)
COPY --from=ghcr.io/mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/

RUN install-php-extensions gd pdo_mysql @composer

# Set the working directory inside the container
WORKDIR /var/www

# Copy the contents of the local Laravel project into the container
COPY . .
