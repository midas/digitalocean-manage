module Digitalocean
  module Manage
    module Formatter
      class Regions < Acclimate::Formatter

        def initialize( regions )
          @regions = regions
        end

        def render
          region_formatters.map( &:render ).
                            join( "\n" )
        end

      protected

        def region_formatters
          @region_formatters ||= regions.map do |region|
            Digitalocean::Manage::Formatter::Region.new( region )
          end
        end

        attr_reader :regions

      end
    end
  end
end
