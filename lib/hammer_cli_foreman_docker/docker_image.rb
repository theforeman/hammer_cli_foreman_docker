module HammerCLIForemanDocker
  class DockerImageCommand < HammerCLIForeman::Command
    resource :docker_images
    command_name 'image'
    desc _('Manage docker images')

    class ListCommand < HammerCLIForeman::ListCommand
      output do
        field :id, _("ID")
        field :image_id, _("Image ID")
        field :size, _("Size")
      end

      build_options do |o|
        o.expand.including(:products, :organizations, :content_views)
      end
    end

    class InfoCommand < HammerCLIForeman::InfoCommand
      output do
        field :id, _("ID")
        field :image_id, _("Image ID")
        field :size, _("Size")

        collection :tags, _("Tags") do
          field :repository_id, _("Repository ID")
          field :tag, _("Tag")
        end
      end

      build_options
    end

    autoload_subcommands
  end
end
