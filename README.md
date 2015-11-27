## Trellis • Chef Cookbooks
To be used with OpsWorks

### Cookbooks

#### code
Manage code deployment and dependencies.

**Recipes**

- `code::setup` Install dependencies (composer)
- `code::build` Build the project, for backend it installs dependencies (composer), for frotnend it builds it
- `code::deploy` Deploy a version of the code
- `code::mount` A workaround for Docker to mount OpsWorks deploy directory `/srv/www` for it being a symlink directory
- `code::install_dependencies` Run composer install inside the project directory
- `code::permissions` Fix permissions for your project. i.e. for Laravel projects the `storage/` directory's mode must be 0755
- `code::env` Prepare the environment variables read from OpsWorks (or any passed in variables) and put them in .env

Add the following to the corresponding lifecycles events for a full revision deployment process:

**Setup**
- `code::setup`

**Deploy**
- `code::deploy`
- `code::build`
- `code::permissions`
- `code::env`

> IMPORTANT!
In the case of Laravel, add `code::env` to the end of the deploy lifecycle to have
a .env file generated out of the environment variables passed in from the App in OpsWorks.

### Templates

#### HAProxy
Overrides the HAProxy template so that it replaces the built-in with more dynamic properties, can be configured as such:

```json
{
    "haproxy": {
        "default_backend": "najem",
        "frontends": [
            {
                "title": "main",
                "address": "*:80",
                "acls": [
                   "is_najem hdr_dom(host) -i najem.com",
                   "is_najem hdr_dom(host) -i www.najem.com",

                   "is_api hdr_dom(host) -i api.najem.com"
                ],
                "use_backends": [
                    {
                        "title": "najem",
                        "when": "is_najem"
                    },
                    {
                        "title": "api",
                        "when": "is_api"
                    }
                ]
            }
        ],
        "backends": [
            {
                "title": "najem",
                "servers": [
                    "server najem-web-I 172.31.41.133:80 check inter 5000 fastinter 1000 fall 1 weight 1"
                ]
            },
            {
                "title": "api",
                "servers": [
                    "server api-web-I 172.31.41.133:80 check inter 5000 fastinter 1000 fall 1 weight 1"
                ]
            }
        ]
    }
}
```
