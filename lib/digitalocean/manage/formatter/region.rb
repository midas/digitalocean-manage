require 'forwardable'

module Digitalocean
  module Manage
    module Formatter
      class Region < Acclimate::Formatter

        extend Forwardable

        def initialize( region )
          @region = region
        end

        def render
          renderred
        end

      protected

        attr_reader :region

        def_delegators :region, :name, :available, :slug

        def renderred
          @renderred ||= capture do
            table do
              attributes.each do |attr|
                row do
                  column attr, width: col_width, align: 'right', color: :cyan
                  column send( attr ), width: 50
                end
              end
            end
          end
        end

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
