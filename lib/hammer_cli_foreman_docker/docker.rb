module HammerCLIForemanDocker
  class DockerCommand < HammerCLI::AbstractCommand
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
  end
end
