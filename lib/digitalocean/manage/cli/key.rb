module Digitalocean
  module Manage
    class Cli
      class Key < Thor

        include Acclimate::CliHelper

        def self.banner( command, namespace=nil, subcommand=false )
          return "#{basename} key help [SUBCOMMAND]" if command.name == 'help'
          "#{basename} #{command.usage}"
        end

        desc "key list", "List all keys"
        #long_desc <<-LONGDESC
        #LONGDESC
        def list
          execute Digitalocean::Manage::Command::Key::List
        end

      end
    end
  end
end
