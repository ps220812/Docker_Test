#dockerfile
FROM php:latest

RUN apt-get update -y && apt-get install -y libmcrypt-dev

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN docker-php-ext-install pdo_mysql

WORKDIR /SummaL4Deployment
COPY . /SummaL4Deployment

RUN composer update

EXPOSE 8000
CMD php artisan serve --host=0.0.0.0 --port=8000
