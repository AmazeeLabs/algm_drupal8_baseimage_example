FROM algmprivsecops/drupal8 

COPY composer.json composer.lock /app/
ENV COMPOSER_MEMORY_LIMIT=-1
RUN composer install --no-dev
COPY ./modules /app/web/modules/custom
COPY ./themes/ /app/web/themes/custom
COPY ./sites/default/ /app/web/sites/default/
COPY ./config/sync/ /app/config/sync/

# Define where the Drupal Root is located
ENV WEBROOT=web
