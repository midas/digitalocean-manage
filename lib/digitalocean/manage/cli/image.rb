module Digitalocean
  module Manage
    class Cli
      class Image < Thor

        include Acclimate::CliHelper

        def self.banner( command, namespace=nil, subcommand=false )
          return "#{basename} image help [SUBCOMMAND]" if command.name == 'help'
          "#{basename} #{command.usage}"
        end

        desc "image list", "List all images"
        #long_desc <<-LONGDESC
        #LONGDESC
        def list
          execute Digitalocean::Manage::Command::Image::List
        end

        desc "image find", "Find and image by id or slug"
        #long_desc <<-LONGDESC
        #LONGDESC
        def find( id_or_slug )
          execute Digitalocean::Manage::Command::Image::Find, id_or_slug: id_or_slug
        end

      end
    end
  end
end
