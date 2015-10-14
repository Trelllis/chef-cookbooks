## Trellis • Chef Cookbooks
To be used with OpsWorks

### Cookbooks

#### code
Manage code deployment and dependencies

**Recipes**

- `code::setup` Install dependencies (composer)
- `code::deploy` Deploy a version of the code
- `code::mount` A workaround for Docker to mount a symlink directory
- `code::install_dependencies` Run composer install inside the project directory
- `code::symlink_storage` Move the storage directory into a shared directory so that it can be used by each release

Add the following to the *Deploy* lifecycle for a full deployment/installation process:

`code::setup` `code::deploy` `code::install_dependencies` `code::symlink_storage`

