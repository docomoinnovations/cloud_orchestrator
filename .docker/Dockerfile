
FROM drupal
RUN apt-get update && apt-get -y install zip git libcap2-bin
RUN curl -Lo /usr/local/bin/composer https://getcomposer.org/download/1.9.1/composer.phar && chmod +x /usr/local/bin/composer
COPY php.ini-production /usr/local/etc/php/php.ini
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf
RUN a2dissite 000-default && a2ensite 000-default && rm -rf /var/www/html
RUN cd /var/www/ && composer create-project docomoinnovations/cloud_orchestrator --stability=dev  html && \
    chown -R www-data:www-data /var/www/html && chmod 775 -R /var/www/html
WORKDIR /var/www/html
RUN composer require drupal/cloud:2.x-dev && composer require drupal/bootstrap
RUN mkdir -p docroot/config/sync && chmod 777 -R docroot/config/sync && \
    mkdir -p /var/www/html/docroot/private && chmod 777 -R docroot/private
COPY settings.php docroot/sites/default
COPY settings.local.php docroot/sites/default
RUN chmod 777 -R docroot/sites/default/settings*
RUN chown -hR www-data:www-data /etc/apache2
RUN setcap 'cap_net_bind_service=+ep' /usr/sbin/apache2
RUN getcap /usr/sbin/apache2
USER www-data
