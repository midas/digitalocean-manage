module Digitalocean
  module Manage
    class Cli
      class Droplet < Thor

        include Acclimate::CliHelper

        def self.banner( command, namespace=nil, subcommand=false )
          return "#{basename} droplet help [SUBCOMMAND]" if command.name == 'help'
          "#{basename} #{command.usage}"
        end

        desc "droplet find", "Find a droplet by id or name"
        #long_desc <<-LONGDESC
        #LONGDESC
        def find
          execute Digitalocean::Manage::Command::Droplet::Find
        end

        desc "droplet list", "List all droplets"
        #long_desc <<-LONGDESC
        #LONGDESC
        def list
          execute Digitalocean::Manage::Command::Droplet::List
        end

      end
    end
  end
end
