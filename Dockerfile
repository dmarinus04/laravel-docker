# Set the base image to PHP 8.1 with Apache
FROM php:8.4-fpm

# Install dependencies
RUN apt-get update && apt-get install -y libpng-dev libjpeg-dev libfreetype6-dev zip git && \
    docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-install gd pdo pdo_mysql

# Set the working directory inside the container
WORKDIR /var/www

# Copy the contents of the local Laravel project into the container
COPY . .

# Expose port 80 to be accessible from outside the container
EXPOSE 80

# Install Composer globally
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
