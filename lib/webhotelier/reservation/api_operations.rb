module Webhotelier
  module Reservation
    module ApiOperations

      #
      # https://docs.webhotelier.net/integration-api-reservation-search
      #
      def search(client:, options: {})
        Response.new(client.conn.get('/reservation', options))
      end

      #
      # https://docs.webhotelier.net/integration-api-reservation-sources
      #
      def sources(client:, options: {})
        Response.new(client.conn.get('/sources', options))
      end

      def pending(client:)
        Response.new(client.conn.get("/reservation/new"))
      end

      def synced(client:, id:)
        client.conn.get("/reservation/sync/#{id}")
      end

      def find(client:, id:)
        Response.new(client.conn.get("/reservation/#{id}"))
      end

      def fetch!(client:, resource:)
        resource.attributes = find(
          client: client,
          id: resource.id
        ).resource.attributes
        resource
      end

    end
  end
end
