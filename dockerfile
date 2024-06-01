# Usare un'immagine di base ufficiale di PHP
FROM php:8.2-fpm

# Impostare il working directory
WORKDIR /var/www

# Installare le dipendenze di sistema necessarie
RUN apt-get update && apt-get install -y \
    build-essential \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    locales \
    zip \
    jpegoptim optipng pngquant gifsicle \
    vim \
    unzip \
    git \
    curl

# Installare le estensioni PHP necessarie
RUN docker-php-ext-install pdo pdo_mysql gd exif pcntl bcmath opcache

# Installare Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Copiare i file dell'applicazione
COPY . .

# Impostare i permessi corretti
RUN chown -R www-data:www-data /var/www \
    && chmod -R 755 /var/www

# Installare le dipendenze PHP
RUN composer install --prefer-dist --no-scripts --no-dev --optimize-autoloader

# Esposizione della porta
EXPOSE 8000

# Comando di avvio
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]
