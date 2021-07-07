FROM php:7.4-fpm

COPY docker/php/php.ini /usr/local/etc/php/conf.d/docker-php.ini

ARG HOST_USER
ARG HOST_GROUP
ARG HOST_UID
ARG HOST_GID

RUN apt-get update && apt-get install -y \
    gnupg \
    g++ \
    procps \
    openssl \
    git \
    unzip \
    zlib1g-dev \
    libzip-dev \
    libfreetype6-dev \
    libpng-dev \
    libjpeg-dev \
    libicu-dev  \
    libonig-dev \
    libxslt1-dev \
    acl

RUN docker-php-ext-configure gd --with-jpeg --with-freetype

RUN docker-php-ext-install \
    pdo pdo_mysql zip xsl gd intl opcache exif mbstring

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

<<<<<<< HEAD:docker/php/macos.Dockerfile
WORKDIR /app
=======
RUN groupadd -g ${HOST_GID} ${HOST_GROUP} \
  && useradd -r -g ${HOST_GROUP} ${HOST_USER} \
  && usermod -u ${HOST_UID} ${HOST_USER}

RUN mkdir /home/${HOST_USER}

RUN chown -R ${HOST_USER} /home/${HOST_USER}

WORKDIR /app

USER ${HOST_USER}
>>>>>>> 708e5026c389b13c48967f95d0a97d301bce0ab6:docker/php/Dockerfile
