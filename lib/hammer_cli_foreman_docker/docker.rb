module HammerCLIForemanDocker
  class DockerCommand < HammerCLIForeman::Command
    if HammerCLIForeman.foreman_resource(:docker_manifests)
      require 'hammer_cli_foreman_docker/docker_manifest'
      subcommand 'manifest',
                 HammerCLIForemanDocker::DockerManifestCommand.desc,
                 HammerCLIForemanDocker::DockerManifestCommand
    end
    if HammerCLIForeman.foreman_resource(:docker_tags)
      require 'hammer_cli_foreman_docker/docker_tag'
      subcommand 'tag',
                 HammerCLIForemanDocker::DockerTagCommand.desc,
                 HammerCLIForemanDocker::DockerTagCommand
    end
    if HammerCLIForeman.foreman_resource(:registries)
      require 'hammer_cli_foreman_docker/docker_registry'
      subcommand 'registry',
                 HammerCLIForemanDocker::DockerRegistryCommand.desc,
                 HammerCLIForemanDocker::DockerRegistryCommand
    end
    if HammerCLIForeman.foreman_resource(:containers)
      require 'hammer_cli_foreman_docker/docker_container'
      subcommand 'container',
                 HammerCLIForemanDocker::DockerContainerCommand.desc,
                 HammerCLIForemanDocker::DockerContainerCommand
    end
  end
end
