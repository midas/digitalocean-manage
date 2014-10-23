require 'digitalocean/api'

module Digitalocean
  module Manage
    class Command
      module Droplet

        autoload :List, 'digitalocean/manage/command/droplet/list'

      end
    end
  end
end
