module Digitalocean
  module Api

  protected

    def droplets
      @droplets ||= client.droplets.all.to_a
    end

    def regions
      @regions ||= client.regions.all.to_a
    end

    def sizes
      @sizes ||= client.sizes.all.to_a
    end

    def client
      @client ||= DropletKit::Client.new( access_token: config.api_token )
    end

  end
end
