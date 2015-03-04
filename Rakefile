require 'bundler/gem_tasks'

begin
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new

  task :default do
    Rake::Task['rubocop'].execute
  end
rescue => _
  puts "Rubocop not loaded."
end

namespace :gettext do
  desc "Update pot file"
  task :find do
    require "hammer_cli_foreman_docker/version"
    require "hammer_cli_foreman_docker/i18n"
    require 'gettext/tools'

    domain = HammerCLIForemanDocker::I18n::LocaleDomain.new
    GetText.update_pofiles(domain.domain_name, domain.translated_files,
                           "#{domain.domain_name} #{HammerCLIForemanDocker.version}",
                           :po_root => domain.locale_dir)
  end
end

namespace :pkg do
  desc 'Generate package source gem'
  task :generate_source => :build
end
