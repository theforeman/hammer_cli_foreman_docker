require 'hammer_cli_foreman'

module HammerCLIForemanDocker
  HammerCLI::MainCommand.lazy_subcommand("docker", _("Manipulate docker content"),
                                         'HammerCLIForemanDocker::DockerCommand',
                                         'hammer_cli_foreman_docker/docker'
  )
end
