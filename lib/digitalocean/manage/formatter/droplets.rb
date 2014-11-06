module Digitalocean
  module Manage
    module Formatter
      class Droplets < Acclimate::Formatter

        def initialize( droplets )
          @droplets = droplets
        end

        def render
          droplet_formatters.map( &:render ).
                             join( "\n" )
        end

      protected

        def droplet_formatters
          @droplet_formatters ||= droplets.map do |droplet|
            Digitalocean::Manage::Formatter::Droplet.new( droplet )
          end
        end

        attr_reader :droplets

      end
    end
  end
end
