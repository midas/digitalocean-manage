require 'forwardable'

module Digitalocean
  module Manage
    module Formatter
      class EntityTableFormatter < Acclimate::Formatter

        def render
          renderred
        end

      protected

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
          raise NotImplementedError
        end

        def col_width
          @col_width ||= attributes.map( &:size ).max + 0
        end

      end
    end
  end
end
