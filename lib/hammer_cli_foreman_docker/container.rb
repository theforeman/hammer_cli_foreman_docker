require 'hammer_cli'
require 'hammer_cli_foreman'

module HammerCLIForemanDocker
  class Container < HammerCLIForeman::Command
    resource :container

    class ListCommand < HammerCLIForeman::ListCommand
      output do
        field :tag, _('Tag')
      end

      build_options
    end

    autoload_subcommands
  end

  HammerCLI::MainCommand.subcommand 'container', 'Manage Docker containers', Container
end
