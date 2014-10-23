module Digitalocean
  module Manage
    module ShellHelper

      def self.included( base )
        base.send( :include, CommandLineReporter )
        base.send( :include, Thor::Shell )
      end

    end
  end
end
