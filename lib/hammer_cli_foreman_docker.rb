require 'hammer_cli_foreman'

module HammerCLIForemanDocker
  require 'hammer_cli_foreman_docker/version'

  def self.exception_handler_class
    HammerCLIForeman::ExceptionHandler
  end

  require 'hammer_cli_foreman_docker/i18n'

  HammerCLI::MainCommand.lazy_subcommand("docker", _("Manipulate docker content"),
                                         'HammerCLIForemanDocker::DockerCommand',
                                         'hammer_cli_foreman_docker/docker'
  )
end
