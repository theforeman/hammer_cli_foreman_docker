begin
  require 'hammer_cli_katello'

  module HammerCLIForemanDocker
    class DockerImageCommand < HammerCLIForeman::Command
      resource :docker_images
      command_name 'image'
      desc _('Manage docker images')

      class ListCommand < HammerCLIKatello::ListCommand
        include ::HammerCLIKatello::LifecycleEnvironmentNameResolvable
        output do
          field :id, _("ID")
          field :image_id, _("Image ID")
          field :size, _("Size")
          field :_tag_count, _("Tag count")
          field :_tag_list, _("Tags"), Fields::List
        end

        def extend_data(record)
          record["_tag_list"] = (record['tags'] || []).map { |tag| tag['name'] }.uniq
          record["_tag_count"] = record["_tag_list"].count
          record
        end

        build_options do |o|
          o.expand.including(:products, :organizations, :content_views)
        end
      end

      class InfoCommand < HammerCLIKatello::InfoCommand
        output do
          field :id, _("ID")
          field :image_id, _("Image ID")
          field :size, _("Size")

          collection :tags, _("Tags") do
            field :repository_id, _("Repository ID")
            field :name, _("Tag")
          end
        end

        build_options
      end

      autoload_subcommands
    end
  end
rescue LoadError
  warn _("'hammer_cli_katello' needs to be installed for %s command to work") % 'image'
end
