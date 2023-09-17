# Use an official PHP 7.2 image as the base image
FROM php:7.2

# Install system dependencies
RUN apt-get update && \
    apt-get install -y \
    git \
    zip \
    unzip

# Install Composer globally
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Set the working directory to /app
WORKDIR /app

# Copy the composer.json file to the container
COPY . ./

# Install project dependencies using Composer
RUN composer install --no-interaction

# Install PHPUnit globally (adjust the version as needed)
RUN composer require --dev phpunit/phpunit:^7.0

# Specify the command to run your tests
CMD ["vendor/bin/phpunit"]
