module Digitalocean
  module Manage
    module Formatter
      class Sizes < Acclimate::Formatter

        def initialize( sizes )
          @sizes = sizes
        end

        def render
          size_formatters.map( &:render ).
                          join( "\n" )
        end

      protected

        def size_formatters
          @size_formatters ||= sizes.map do |size|
            Digitalocean::Manage::Formatter::Size.new( size )
          end
        end

        attr_reader :sizes

      end
    end
  end
end
