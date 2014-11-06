module Digitalocean
  module Manage
    class Command
      module Droplet
        class List < Digitalocean::Manage::Command

          include Digitalocean::Api

          def execute
            confirm "Getting droplets list from Digital Ocean" do
              droplets
            end

            say nil
            say formatted_droplets
          end

        protected

          def formatted_droplets
            @formatted_droplets ||= droplets_formatter.render
          end

          def droplets_formatter
            @droplets_formatter ||= Digitalocean::Manage::Formatter::Droplets.new( droplets )
          end

        end
      end
    end
  end
end
