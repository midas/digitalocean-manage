module Digitalocean
  module Api

  protected

    def droplets
      @droplets ||= client.droplets.all.to_a
    end

    def image( id_or_slug )
      client.images.find( id: id_or_slug )
    end

    def images
      @images ||= client.images.all.to_a
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
