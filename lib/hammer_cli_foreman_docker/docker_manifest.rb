begin
  require 'hammer_cli_katello'

  module HammerCLIForemanDocker
    class DockerManifestCommand < HammerCLIForeman::Command
      resource :docker_manifests
      command_name 'manifest'
      desc _('Manage docker manifests')

      class ListCommand < HammerCLIKatello::ListCommand
        include ::HammerCLIKatello::LifecycleEnvironmentNameResolvable
        output do
          field :id, _("ID")
          field :name, _("Name")
          field :schema_version, _("Schema Version")
          field :digest, _("Digest")
          field :downloaded, _("Downloaded"), Fields::Boolean
          from :tag do
            field :name, _("Tag Name")
          end
        end

        build_options do |o|
          o.expand.including(:products, :organizations, :content_views)
        end
      end

      class InfoCommand < HammerCLIKatello::InfoCommand
        output do
          field :id, _("ID")
          field :name, _("Name")
          field :schema_version, _("Schema Version")
          field :digest, _("Digest")
          field :downloaded, _("Downloaded"), Fields::Boolean
          from :tag do
            field :name, _("Tag Name")
          end
        end

        build_options
      end

      autoload_subcommands
    end
  end
rescue LoadError
  warn _("'hammer_cli_katello' needs to be installed for %s command to work") %
    DockerManifestCommand.command_name
  exit 1
end
