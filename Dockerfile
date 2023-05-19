FROM docker.io/pandoc/latex
WORKDIR /src
COPY composer.* ./

# Install composer, refer: https://github.com/geshan/docker-php-composer-alpine/blob/master/Dockerfile
RUN apk --update add wget \ 
		     curl \
		     git \
		     php8 \
		     php8-curl \
		     php8-openssl \
		     php8-iconv \
		     php8-json \
		     php8-mbstring \
		     php8-phar \
             php8-xml \
			 php8-simplexml \
		     php8-dom && rm /var/cache/apk/*

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer 
# end of install composer

RUN composer install
COPY . .
CMD ["sh"]