module Digitalocean
  module Manage
    class Command
      module Key
        class List < ::Digitalocean::Manage::Command

          include Digitalocean::Api

          def execute
            confirm "Getting keys list from Digital Ocean" do
              keys
            end

            binding.pry
            say nil
            say formatted_keys
          end

        protected

          def formatted_keys
            @formatted_keys ||= keys_formatter.render
          end

          def keys_formatter
            @keys_formatter ||= Digitalocean::Manage::Formatter::Keys.new( keys )
          end

        end
      end
    end
  end
end
