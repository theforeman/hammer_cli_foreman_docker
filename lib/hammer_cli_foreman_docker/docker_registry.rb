require 'hammer_cli'
require 'hammer_cli_foreman'

module HammerCLIForemanDocker
  class DockerRegistryCommand < HammerCLIForeman::Command
    resource :registries
    command_name 'registry'
    desc _('Manage docker registries')

    class ListCommand < HammerCLIForeman::ListCommand
      output do
        field :id, _("ID")
        field :name, _('Name')
        field :url, _('URL')
      end

      build_options
    end

    class InfoCommand < HammerCLIForeman::InfoCommand
      output do
        field :id, _("ID")
        field :name, _('Name')
        field :url, _('URL')
        field :description, _('Description')

        HammerCLIForeman::References.taxonomies(self)
        HammerCLIForeman::References.timestamps(self)
      end

      build_options
    end

    class CreateCommand < HammerCLIForeman::CreateCommand
      success_message _("Docker registry created")
      failure_message _("Could not create the registry")

      build_options
    end

    class UpdateCommand < HammerCLIForeman::UpdateCommand
      success_message _("Docker registry updated")
      failure_message _("Could not update the registry")

      build_options
    end

    class DeleteCommand < HammerCLIForeman::DeleteCommand
      success_message _("Docker registry deleted")
      failure_message _("Could not delete the registry")

      build_options
    end

    autoload_subcommands
  end
end
