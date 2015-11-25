name "redis"
description "Setup the server to host a Redis instance"
maintainer "Vinelab"
license "MIT"
version "1.0.0"

depends "sysctl"

recipe "redis:configure", "Configure the server to host a production-ready Redis instance."
