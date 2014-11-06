require 'forwardable'

module Digitalocean
  module Manage
    module Formatter
      class Size < Acclimate::Formatter

        extend Forwardable

        def initialize( size )
          @size = size
        end

        def render
          renderred
        end

      protected

        attr_reader :size

        def_delegators :size, :slug, :price_monthly, :price_hourly, :transfer

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
            memory
            transfer
            price_monthly
            price_hourly
          )
        end

        def memory
          slug
        end

        def col_width
          @col_width ||= attributes.map( &:size ).max + 0
        end

      end
    end
  end
end
