name        "code"
description "Manage code deployment and dependencies."
maintainer  "Vinelab"
license     "MIT"
version     "1.0.0"

depends "deploy"
depends "composer"
depends "opsworks_ecs"

recipe "code::deploy", "Deploy a version of the code"
recipe "code::mount", "A workaround for Docker to mount a symlink directory"
recipe "code::install_dependencies", "Run composer install inside the project directory"
recipe "code::symlink_storage", "Move the storage directory into a shared directory so that it can be used by each release"
