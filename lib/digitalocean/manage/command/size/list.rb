module Digitalocean
  module Manage
    class Command
      module Size
        class List < Digitalocean::Manage::Command

          include Digitalocean::Api

          def execute
            confirm "Getting sizes list from Digital Ocean" do
              sizes
            end

            say nil
            say formatted_sizes
          end

        protected

          def formatted_sizes
            @formatted_sizes ||= sizes_formatter.render
          end

          def sizes_formatter
            @sizes_formatter ||= Digitalocean::Manage::Formatter::Sizes.new( sizes )
          end

        end
      end
    end
  end
end
