require 'forwardable'

module Digitalocean
  module Manage
    module Formatter
      class Image < EntityTableFormatter

        extend Forwardable

        def initialize( image )
          @image = image
        end

      protected

        attr_reader :image

        def_delegators :image, :distribution, :id, :name, :public, :slug

        def attributes
          %w(
            slug
            distribution
            id
            name
            public
          )
        end

        def features
          image.regions.join( ', ' )
        end

      end
    end
  end
end
