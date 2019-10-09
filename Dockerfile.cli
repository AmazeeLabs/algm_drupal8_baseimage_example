FROM algmprivsecops/drupal8 

COPY composer.json composer.lock /app/
RUN composer update --with-dependencies amazeelabs/algm_drupal8_baseimage
RUN composer install --no-dev
COPY ./modules /app/web/modules/custom
COPY ./themes/ /app/web/themes/custom

# Define where the Drupal Root is located
ENV WEBROOT=web
