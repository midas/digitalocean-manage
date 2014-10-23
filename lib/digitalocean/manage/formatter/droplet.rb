require 'forwardable'

module Digitalocean
  module Manage
    class Formatter
      class Droplet < Digitalocean::Manage::Formatter

        extend Forwardable

        def initialize( droplet )
          @droplet = droplet
        end

        def render
          renderred
        end

      protected

        attr_reader :droplet

        def_delegators :droplet, :name, :id, :status, :memory, :vcpus, :disk, :locked, :created_at, :region, :image, :networks, :size

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
            name
            id
            status
            ips_v4
            netmasks_v4
            gateways_v4
            ips_v6
            memory
            vcpus
            disk
            locked
            created_at
            disk_size
            features
            image_name
            image_id
            image_distribution
            region_name
            region_slug
            price_monthly
            price_hourly
          )
        end

        def ips_v4
          networks.v4.map { |n| "#{n.type}: #{n.ip_address}" }.join( ', ' )
        end

        def netmasks_v4
          networks.v4.map { |n| "#{n.type}: #{n.netmask}" }.join( ', ' )
        end

        def gateways_v4
          networks.v4.map { |n| "#{n.type}: #{n.gateway}" }.join( ', ' )
        end

        def ips_v6
          networks.v6.map { |n| "#{n.type}: #{n.ip_address}" }.join( ', ' )
        end

        def price_monthly
          size.price_monthly
        end

        def price_hourly
          size.price_hourly
        end

        def disk_size
          size.slug
        end

        def features
          droplet.features.join( ', ' )
        end

        def region_slug
          region.slug
        end

        def region_name
          region.name
        end

        def image_name
          image.name
        end

        def image_distribution
          image.distribution
        end

        def image_id
          image.id
        end

        def col_width
          @col_width ||= attributes.map( &:size ).max + 0
        end

      end
    end
  end
end
