# Development Vagrant Box

Development box in Vagrant used for sandpit environments.

## Installing Modules
```
cd modules
puppet module install <module name> --modulepath .
# edit manifests/default.pp
include <module name>
```
