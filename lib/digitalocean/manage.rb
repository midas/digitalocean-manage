require 'digitalocean/manage/version'
require 'acclimate'
require 'droplet_kit'
require 'command_line_reporter'

module Digitalocean
  module Manage

    autoload :Cli,           'digitalocean/manage/cli'
    autoload :Command,       'digitalocean/manage/command'
    autoload :Configuration, 'digitalocean/manage/configuration'
    autoload :Formatter,     'digitalocean/manage/formatter'
    autoload :ShellHelper,   'digitalocean/manage/shell_helper'

  end
end
