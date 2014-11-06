require 'forwardable'

module Digitalocean
  module Manage
    module Formatter
      class Key < EntityTableFormatter

        extend Forwardable

        def initialize( key )
          @key = key
        end

      protected

        attr_reader :key

        def_delegators :key, :id, :fingerprint, :public_key, :name

        def attributes
          %w(
            name
            id
            fingerprint
            public_key
          )
        end

      end
    end
  end
end
