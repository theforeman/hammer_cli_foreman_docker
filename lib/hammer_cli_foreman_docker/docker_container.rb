require 'hammer_cli'
require 'hammer_cli_foreman'

module HammerCLIForemanDocker
  class DockerContainerCommand < HammerCLIForeman::Command
    resource :containers
    command_name 'container'
    desc _('Manage docker containers')


    class ListCommand < HammerCLIForeman::ListCommand
      output do
        field :name, _('Name')
        field :repository_name, _('Image repository')
        field :tag, _('Tag')
        field :command, _('Command')
        field nil, _('Compute resource'), Fields::SingleReference, :key => :compute_resource
      end

      build_options
    end

    class InfoCommand < HammerCLIForeman::InfoCommand

      output ListCommand.output_definition do
        field :entrypoint, _('Entrypoint')
        field :cpu_set , _('CPU set')
        field :cpu_shares , _('CPU shares')
        field :memory , _('Memory (Bytes)')
        field :tty, _('TTY'), Fields::Boolean
        field :attach_stdin, _('Attach STDIN'), Fields::Boolean
        field :attach_stdout, _('Attach STDOUT'), Fields::Boolean
        field :attach_stderr, _('Attach STDERR'), Fields::Boolean
        field nil, _('Registry'), Fields::SingleReference, :key => :registry
        HammerCLIForeman::References.taxonomies(self)
        HammerCLIForeman::References.timestamps(self)
      end

      build_options
    end

    class CreateCommand < HammerCLIForeman::CreateCommand
      success_message _("Docker container created")
      failure_message _("Could not create the container")

      build_options
    end

    class DeleteCommand < HammerCLIForeman::DeleteCommand
      success_message _("Docker container deleted")
      failure_message _("Could not delete the container")

      build_options
    end

    class LogsCommand < HammerCLIForeman::InfoCommand
      command_name 'logs'
      action :logs

      output do
        field :logs, _('Logs')
      end

      def record_to_common_format(data)
        # data heuristic fails, suppress the transformation
        data
      end

      build_options
    end


    class StatusCommand < HammerCLIForeman::InfoCommand
      command_name "status"
      action :power

      output do
        field :running, _("Running"), Fields::Boolean
      end

      def request_params
        params = super
        params['power_action'] = 'status'
        params
      end

      def record_to_common_format(data)
        # data heuristic fails, suppress the transformation
        data
      end

      build_options :without => :power_action
    end


    class StartCommand < HammerCLIForeman::SingleResourceCommand
      command_name "start"
      action :power

      desc _("Power a container on")
      success_message _("The container was started.")

      def request_params
        params = super
        params['power_action'] = 'start'
        params
      end

      build_options :without => :power_action
    end


    class StopCommand < HammerCLIForeman::SingleResourceCommand
      command_name "stop"
      action :power

      desc _("Power a container off")
      success_message _("The container was stopped.")

      def request_params
        params = super
        params['power_action'] = 'stop'
        params
      end

      build_options :without => :power_action
    end

    autoload_subcommands
  end

end
