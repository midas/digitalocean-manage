module Digitalocean
  module Manage
    class Command < Acclimate::Command

      extend Autoloaded

    protected

      def config_klass
        Digitalocean::Manage::Configuration
      end

      def ensure_config_file!
        return if config_filepath.file?

        raise_error "Configuration file does not exist: #{config_filepath.expand_path}."
      end

      #def raise_error( msg )
        #raise NcitePassControl::Deploy::Error, msg
      #end

    end
  end
end
