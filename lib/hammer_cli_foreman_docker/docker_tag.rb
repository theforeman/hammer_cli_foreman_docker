begin
  require 'hammer_cli_katello'

  module HammerCLIForemanDocker
    class DockerTagCommand < HammerCLIForeman::Command
      resource :docker_tags
      command_name 'tag'
      desc _('Manage docker tags')

      class ListCommand < HammerCLIKatello::ListCommand
        include ::HammerCLIKatello::LifecycleEnvironmentNameResolvable
        output do
          field :id, _("ID")
          field :name, _("Tag")
          field :repository_id, _("Repository ID")
        end

        build_options do |o|
          o.expand.including(:products, :organizations, :content_views)
        end
      end

      class InfoCommand < HammerCLIKatello::InfoCommand
        output do
          field :id, _("ID")
          field :name, _("Tag")
          field :repository_id, _("Repository ID")

          from :image do
            field :id, _("Docker Image ID")
          end
        end

        build_options
      end

      autoload_subcommands
    end
  end
rescue LoadError
  warn _("'hammer_cli_katello' needs to be installed for %s command to work") % 'tag'
end
