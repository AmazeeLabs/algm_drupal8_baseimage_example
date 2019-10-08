ARG CLI_IMAGE
FROM ${CLI_IMAGE} as cli

FROM algmprivsecops/drupal8_php 

COPY --from=cli /app /app
