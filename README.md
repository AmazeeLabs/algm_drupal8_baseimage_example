# Template for Drupal projects hosted on amazee.io

This project template should provide a kickstart for managing your site dependencies with [Composer](https://getcomposer.org/). It is based on the [original Drupal Composer Template](https://github.com/drupal-composer/drupal-project), but includes everything necessary to run on amazee.io (either the local development environment or on amazee.io servers.)

Furthermore, it is built on top of a Drupal base image which means that your Drupal Core version will be automatically managed by the upstream repository which is checked for version updates every time your site is deployed, when you add or update packages using composer.


## Requirements

* [docker](https://docs.docker.com/install/).
* [pygmy](https://docs.amazee.io/local_docker_development/pygmy.html) `gem install pygmy` (you might need sudo for this depending on your ruby configuration)

## Local environment setup

1. Checkout project repo and confirm the path is in docker's file sharing config - https://docs.docker.com/docker-for-mac/#file-sharing

```
git clone https://github.com/AmazeeLabs/algm_drupal8_baseimage_example drupal8-lagoon && cd $_
```

2. Make sure you don't have anything running on port 80 on the host machine (like a web server) then run `pygmy up`

3. Build and start the build images

```
docker-compose up -d
docker-compose exec cli composer install
```

4. Visit the new site @ `http://drupal-example-multisite1.docker.amazee.io`



## Working with the local environment

As described below, you do not check in the entire Drupal installation under version control.
Practically this means that most tasks for local development will be done inside the containers (for instance, running composer and drush commands).

Once your project is installed, run `docker-compose exec cli bash` in order to get a shell into the container.

## Where do I place my custom settings, modules, themes, etc.

This template aims to check into VCS _only_ those _custom_ files required by your project. As such you'll note that there are only a few directories available in your local development directory.
These are then mapped into the appropriate directories inside the container.

* `/modules` is mapped to `/App/web/modules/custom`
* `/themes` is mapped to `/App/web/themes/custom`
* `/sites/default` is mapped to `/App/web/sites/default`
* `/config` is mapped to `/App/config/sync`


## Updating Drupal Core

Drupal core updates are taken care of by the upstream project.
There should be no reason to update core manually.


## What does the template do?

When installing the given `composer.json` some tasks are taken care of:

* Drupal will be installed in the `web`-directory.
* Autoloader is implemented to use the generated composer autoloader in `vendor/autoload.php`,
  instead of the one provided by Drupal (`web/vendor/autoload.php`).
* Modules (packages of type `drupal-module`) will be placed in `web/modules/contrib/`
* Themes (packages of type `drupal-theme`) will be placed in `web/themes/contrib/`
* Profiles (packages of type `drupal-profile`) will be placed in `web/profiles/contrib/`
* Creates the `web/sites/default/files`-directory.
* Latest version of drush is installed locally for use at `vendor/bin/drush`.
* Latest version of [Drupal Console](http://www.drupalconsole.com) is installed locally for use at `vendor/bin/drupal`.



## FAQ

### Should I commit the contrib modules I download?

Composer recommends **no**. They provide [argumentation against but also
workarounds if a project decides to do it anyway](https://getcomposer.org/doc/faqs/should-i-commit-the-dependencies-in-my-vendor-directory.md).
Furthermore, the mapping

### How can I apply patches to downloaded modules?

If you need to apply patches (depending on the project being modified, a pull
request is often a better solution), you can do so with the
[composer-patches](https://github.com/cweagans/composer-patches) plugin.

To add a patch to drupal module foobar insert the patches section in the extra
section of composer.json:
```json
"extra": {
    "patches": {
        "drupal/foobar": {
            "Patch description": "URL to patch"
        }
    }
}
```
