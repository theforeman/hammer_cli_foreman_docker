require 'hammer_cli_foreman_docker/docker_container'

module HammerCLIForemanDocker
  class DockerCommand < HammerCLIForeman::Command
    if HammerCLIForeman.foreman_resource(:docker_images)
      require 'hammer_cli_foreman_docker/docker_image'
      subcommand 'image',
                 HammerCLIForemanDocker::DockerImageCommand.desc,
                 HammerCLIForemanDocker::DockerImageCommand
    end
    if HammerCLIForeman.foreman_resource(:docker_tags)
      require 'hammer_cli_foreman_docker/docker_tag'
      subcommand 'tag',
                 HammerCLIForemanDocker::DockerTagCommand.desc,
                 HammerCLIForemanDocker::DockerTagCommand
    end
    subcommand 'container',
               HammerCLIForemanDocker::DockerContainerCommand.desc,
               HammerCLIForemanDocker::DockerContainerCommand
  end
end
