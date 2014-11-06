module Digitalocean
  module Manage
    module Formatter
      class Keys < Acclimate::Formatter

        def initialize( keys )
          @keys = keys
        end

        def render
          key_formatters.map( &:render ).
                         join( "\n" )
        end

      protected

        def key_formatters
          @key_formatters ||= keys.map do |key|
            Digitalocean::Manage::Formatter::Key.new( key )
          end
        end

        attr_reader :keys

      end
    end
  end
end
