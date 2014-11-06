require 'command_line_reporter'

module Digitalocean
  module Manage
    class Formatter

      extend Autoloaded

      include CommandLineReporter

      def render
        raise NotImplementedError
      end

    protected

      def capture( &block )
        suppress_output
        block.call
        capture_output
      end

    end
  end
end
