
FROM drupal
RUN apt-get update && apt-get -y install zip git libcap2-bin sqlite
RUN curl -Lo /usr/local/bin/composer https://getcomposer.org/download/1.9.1/composer.phar && chmod +x /usr/local/bin/composer
RUN rm -rf /var/www/html/*
RUN sed -i "s#/var/www/html/#/var/www/html/web#" /etc/apache2/sites-available/000-default.conf
RUN chown -hR www-data:www-data /etc/apache2
RUN setcap 'cap_net_bind_service=+ep' /usr/sbin/apache2
RUN getcap /usr/sbin/apache2
WORKDIR /var/www/html
COPY composer.json composer.json
RUN chown www-data:www-data -R /var/www
USER www-data
RUN COMPOSER_MEMORY_LIMIT=-1 composer require drupal/bootstrap \
    drupal/bootstrap_cloud:1.x-dev \
    phpunit/phpunit:^6.5 \
    behat/mink-goutte-driver \
    behat/behat \
    symfony/phpunit-bridge:3.4.x-dev \
    maclof/kubernetes-client \
    aws/aws-sdk-php drupal/core-composer-scaffold \
    composer/installers:^1.6 \
    drush/drush:^8
RUN git clone --branch 8.x-2.x \
    https://git.drupalcode.org/project/cloud.git web/modules/contrib/cloud \
    && chmod 775 -R web/sites


