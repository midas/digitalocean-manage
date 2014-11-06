module Digitalocean
  module Manage
    class Cli < Thor

      extend Autoloaded

      include Acclimate::CliHelper

      desc 'droplet SUBCOMMAND', "Operations performed on droplets"
      subcommand "droplet", Digitalocean::Manage::Cli::Droplet

      desc 'size SUBCOMMAND', "Operations performed on sizes"
      subcommand "size", Digitalocean::Manage::Cli::Size

    end
  end
end
