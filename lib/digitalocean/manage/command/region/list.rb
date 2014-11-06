module Digitalocean
  module Manage
    class Command
      module Region
        class List < ::Digitalocean::Manage::Command

          include Digitalocean::Api

          def execute
            confirm "Getting regions list from Digital Ocean" do
              regions
            end

            say nil
            say formatted_regions
          end

        protected

          def formatted_regions
            @formatted_regions ||= regions_formatter.render
          end

          def regions_formatter
            @regions_formatter ||= Digitalocean::Manage::Formatter::Regions.new( regions )
          end

        end
      end
    end
  end
end
