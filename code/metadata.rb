name        "code"
description "Deploy applications' code"
maintainer  "Vinelab"
license     "MIT"
version     "1.0.0"

depends "deploy"
depends "composer"

recipe "code::deploy", "Deploy a version of the code"
recipe "code::mount", "A workaround for Docker running a symlink directory"
recipe "code::install_dependencies", "Run composer install inside the project directory"
recipe "code::symlink_storage", "Move the storage directory into a shared directory so that it can be used by each release"
