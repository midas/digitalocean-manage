#require 'active_support/core_ext/string/inflections'
require 'pathname'

module Digitalocean
  module Manage
    class Configuration < Acclimate::Configuration

      def self.config_filepath
        @@config_filepath ||= Pathname.new( '.do-manage' )
      end

      #def projects_path
        #Pathname.new( super ).expand_path
      #end

    end
  end
end
