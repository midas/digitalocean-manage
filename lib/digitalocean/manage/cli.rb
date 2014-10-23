module Digitalocean
  module Manage
    class Cli < Thor

      autoload :Droplet, 'digitalocean/manage/cli/droplet'

      include Acclimate::CliHelper

      desc 'droplet SUBCOMMAND', "Operations performed on droplets"
      subcommand "droplet", Digitalocean::Manage::Cli::Droplet

    end
  end
end
