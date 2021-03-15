hammer_cli_foreman_docker [![Build Status](https://travis-ci.org/theforeman/hammer_cli_foreman_docker.svg)](https://travis-ci.org/theforeman/hammer_cli_foreman_docker)
=========================================

**The [foreman_docker](https://github.com/theforeman/foreman_docker) plugin has been discontinued. This plugin to hammer-cli has been discontinued additionally.**

This [Hammer CLI](https://github.com/theforeman/hammer-cli) plugin contains
set of commands for [foreman_docker](https://github.com/theforeman/foreman_docker),
a plugin to [Foreman](http://theforeman.org/) for Docker.

Check out the [release notes](doc/release_notes.md#release-notes) to see what's new in the latest version.

Configuration
-------------

Configuration is expected to be placed in one of hammer's configuration directories for plugins:
- `/etc/hammer/cli.modules.d/`
- `~/.hammer/cli.modules.d/`
- `./.config/cli.modules.d/` (config dir in CWD)

If you install `hammer_cli_foreman_docker` from source you'll have to copy the config file manually
from `config/foreman_docker.yml`.

See our [sample config file](https://github.com/theforeman/hammer_cli_foreman_docker/blob/master/config/foreman_docker.yml)
that lists all available configuration options with descriptions.


License
-------

This project is licensed under the GPLv3+.
