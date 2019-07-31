Cloud Orchestrator Distribution
===============================

These are the instructions for building the distribution during development.

1. Copy the composer file https://git.drupalcode.org/project/cloud_orchestrator/blob/8.x-1.x/composer.json into a directory.
    - `mkdir orchestrator`
    - `cd orchestator`
    - `wget -O composer.json https://git.drupalcode.org/project/cloud_orchestrator/raw/8.x-1.x/composer.json?inline=false`
2. Change directory to orchestrator and run composer install.  This will download Drupal, modules, themes and libraries.
    - `cd orchestrator`
    - `composer install`
3. Configure Apache or Nginx to point to the newly created `orchestrator/web` directory as the document root.
4. Run the Drupal installer.
