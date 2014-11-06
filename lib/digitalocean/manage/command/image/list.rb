module Digitalocean
  module Manage
    class Command
      module Image
        class List < ::Digitalocean::Manage::Command

          include Digitalocean::Api

          def execute
            confirm "Getting images list from Digital Ocean" do
              images
            end

            say nil
            say formatted_images
          end

        protected

          def formatted_images
            @formatted_images ||= images_formatter.render
          end

          def images_formatter
            @images_formatter ||= Digitalocean::Manage::Formatter::Images.new( images )
          end

        end
      end
    end
  end
end
