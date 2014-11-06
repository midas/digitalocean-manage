module Digitalocean
  module Manage
    class Command
      module Image
        class Find < ::Digitalocean::Manage::Command

          include Digitalocean::Api

          def execute
            found_image = nil
            confirm "Finding image '#{config.id_or_slug}' from Digital Ocean" do
              found_image = image( config.id_or_slug )
            end

            if found_image.is_a?( String )
              say_stderr "Failed to find image with ID or slug: #{config.id_or_slug}", :red
            else
              say nil
              say( Digitalocean::Manage::Formatter::Image.new( found_image ).render )
            end
          end

        end
      end
    end
  end
end
