module Digitalocean
  module Manage
    class Cli < Thor

      extend Autoloaded

      include Acclimate::CliHelper

      desc 'droplet SUBCOMMAND', "Operations performed on droplets"
      subcommand "droplet", Digitalocean::Manage::Cli::Droplet

    end
  end
end
