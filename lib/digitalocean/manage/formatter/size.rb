require 'forwardable'

module Digitalocean
  module Manage
    module Formatter
      class Size < EntityTableFormatter

        extend Forwardable

        def initialize( size )
          @size = size
        end

      protected

        attr_reader :size

        def_delegators :size, :slug, :price_monthly, :price_hourly, :transfer

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
