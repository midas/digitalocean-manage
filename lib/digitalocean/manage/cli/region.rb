module Digitalocean
  module Manage
    class Cli
      class Region < Thor

        include Acclimate::CliHelper

        def self.banner( command, namespace=nil, subcommand=false )
          return "#{basename} region help [SUBCOMMAND]" if command.name == 'help'
          "#{basename} #{command.usage}"
        end

        desc "region list", "List all regions"
        #long_desc <<-LONGDESC
        #LONGDESC
        def list
          execute Digitalocean::Manage::Command::Region::List
        end

      end
    end
  end
end
