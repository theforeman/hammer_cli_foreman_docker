# -*- encoding: utf-8 -*-
require File.expand_path('../lib/hammer_cli_foreman_docker/version', __FILE__)

Gem::Specification.new do |s|
  s.name          = 'hammer_cli_foreman_docker'
  s.version       = HammerCLIForemanDocker.version.dup
  s.platform      = Gem::Platform::RUBY
  s.authors       = ['David Davis', 'Martin Bačovský']
  s.email         = 'daviddavis@redhat.com'
  s.homepage      = 'http://github.com/theforeman/hammer_cli_foreman_docker'
  s.license       = 'GPL v3+'

  s.summary       = 'Foreman Docker-related commands for Hammer'
  s.description   = 'Foreman Docker-related commands for Hammer CLI'

  s.files            = Dir['{lib,doc,test,locale,config}/**/*', 'README*', 'LICENSE']
  s.test_files       = Dir['{test}/**/*']
  s.extra_rdoc_files = Dir['README*']
  s.require_paths = ['lib']

  s.add_dependency 'hammer_cli_foreman', '>= 0.1.2'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rubocop', '0.28.0'
end
