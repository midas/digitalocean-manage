module Digitalocean
  module Manage
    module Formatter
      class Images < Acclimate::Formatter

        def initialize( images )
          @images = images
        end

        def render
          image_formatters.map( &:render ).
                           join( "\n" )
        end

      protected

        def image_formatters
          @image_formatters ||= images.map do |image|
            Digitalocean::Manage::Formatter::Image.new( image )
          end
        end

        attr_reader :images

      end
    end
  end
end
