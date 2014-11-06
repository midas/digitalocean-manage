require 'forwardable'

module Digitalocean
  module Manage
    module Formatter
      class Region < EntityTableFormatter

        extend Forwardable

        def initialize( region )
          @region = region
        end

      protected

        attr_reader :region

        def_delegators :region, :name, :available, :slug

        def attributes
          %w(
            slug
            name
            available
            sizes
            features
          )
        end

        def features
          region.features.join( ', ' )
        end

        def sizes
          region.sizes.join( ', ' )
        end

        def col_width
          @col_width ||= attributes.map( &:size ).max + 0
        end

      end
    end
  end
end
