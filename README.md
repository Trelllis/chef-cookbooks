## Trellis • Chef Cookbooks
To be used with OpsWorks

### Cookbooks

#### code
Manage code deployment and dependencies

**Recipes**

- `code::setup` Install dependencies (composer)
- `code::deploy` Deploy a version of the code
- `code::mount` A workaround for Docker to mount OpsWorks deploy directory `/srv/www` for it being a symlink directory
- `code::install_dependencies` Run composer install inside the project directory
- `code::permissions` Fix permissions for your project. i.e. for Laravel projects the `storage/` directory's mode must be 0755

Add the following to the *Deploy* lifecycle for a full revision deployment process:

**Setup**
- `code::setup`

**Deploy**
- `code::deploy`
- `code::install_dependencies`
- `code::permissions`

> IMPORTANT!
In the case of Laravel, add `code::env` to the end of the deploy lifecycle to have
a .env file generated out of the environment variables passed in from the App in OpsWorks.

