FROM php:8.3.13-fpm-alpine

RUN docker-php-ext-install pdo pdo_mysql

