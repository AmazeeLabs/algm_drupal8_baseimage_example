ARG CLI_IMAGE
FROM ${CLI_IMAGE} as cli

FROM algmprivsecops/drupal8_nginx

COPY --from=cli /app /app

# Define where the Drupal Root is located
ENV WEBROOT=web
