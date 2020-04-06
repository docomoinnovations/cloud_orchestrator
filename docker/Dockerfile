# Cloud Orchestrator Dockerfile
FROM php:7.3-apache-stretch

RUN set -eux; \
	\
	if command -v a2enmod; then \
		a2enmod rewrite; \
	fi; \
	\
	savedAptMark="$(apt-mark showmanual)"; \
	\
	apt-get update; \
	apt-get install -y --no-install-recommends \
		libfreetype6-dev \
		libjpeg-dev \
		libpng-dev \
		libpq-dev \
		libzip-dev \
		git \
		zip \
		unzip \
		mysql-client \
		cron \
	; \
	\
	docker-php-ext-configure gd \
		--with-freetype-dir=/usr \
		--with-jpeg-dir=/usr \
		--with-png-dir=/usr \
	; \
	\
	docker-php-ext-install -j "$(nproc)" \
		gd \
		opcache \
		pdo_mysql \
		pdo_pgsql \
		zip \
	; \
	\
	curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer && composer global require; \
	\
        # Install Drush
        git clone https://github.com/drush-ops/drush.git /usr/local/src/drush; \
	\
        cd /usr/local/src/drush && git checkout 9.7.1; \
        ln -s /usr/local/src/drush/drush /usr/local/bin/drush; \
 	composer install

# Cloud Orchestrator php configurations
RUN { \
               echo 'memory_limit = -1'; \
               echo 'max_execution_time = 600';\
       } > /usr/local/etc/php/conf.d/extras.ini

RUN { \
  echo '<VirtualHost *:80>'; \
  echo '  DocumentRoot /var/www/cloud_orchestrator/docroot'; \
  echo '  <Directory />'; \
  echo '    Options FollowSymLinks'; \
  echo '    AllowOverride None'; \
  echo '  </Directory>'; \
  echo '  <Directory /var/www/cloud_orchestrator/docroot>'; \
  echo '    Options FollowSymLinks MultiViews'; \
  echo '    AllowOverride All'; \
  echo '    order allow,deny'; \
  echo '    allow from all'; \
  echo '   </Directory>'; \
  echo '  ErrorLog /var/log/apache2/cloud_orchestrator.error.log'; \
  echo '  LogLevel warn'; \
  echo '  CustomLog /var/log/apache2/cloud_orchestrator.access.log combined'; \
  echo '</VirtualHost>'; \
} > /etc/apache2/sites-available/cloud_orchestrator.conf

RUN set -eux; \
	\
    # Unlink default apache configurations
    a2dissite 000-default; \
	a2dissite default-ssl.conf; \
    a2ensite cloud_orchestrator

RUN { \
        echo "*/5 * * * * cd /var/www/cloud_orchestrator && drush cron /dev/null 2>&1"; \
    } | crontab -

WORKDIR /var/www