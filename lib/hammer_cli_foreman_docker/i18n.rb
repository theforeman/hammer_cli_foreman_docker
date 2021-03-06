require 'hammer_cli'

module HammerCLIForemanDocker
  module I18n
    class LocaleDomain < HammerCLI::I18n::LocaleDomain
      def translated_files
        Dir.glob(File.join(File.dirname(__FILE__), '../**/*.rb'))
      end

      def locale_dir
        File.join(File.dirname(__FILE__), '../../locale')
      end

      def domain_name
        'hammer_cli_foreman_docker'
      end
    end

    class SystemLocaleDomain < LocaleDomain
      def locale_dir
        '/usr/share/locale'
      end
    end
  end
end

domain = [
  HammerCLIForemanDocker::I18n::LocaleDomain.new,
  HammerCLIForemanDocker::I18n::SystemLocaleDomain.new].find { |d| d.available? }
HammerCLI::I18n.add_domain(domain) if domain
