module HammerCLIForemanDocker
  class DockerTagCommand < HammerCLIForeman::Command
    resource :docker_tags
    command_name 'tag'
    desc _('Manage docker tags')

    class ListCommand < HammerCLIForeman::ListCommand
      output do
        field :id, _("ID")
        field :tag, _("Tag")
        field :repository_id, _("Repository ID")
      end

      build_options do |o|
        o.expand.including(:products, :organizations, :content_views)
      end
    end

    class InfoCommand < HammerCLIForeman::InfoCommand
      output do
        field :id, _("ID")
        field :tag, _("Tag")
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
