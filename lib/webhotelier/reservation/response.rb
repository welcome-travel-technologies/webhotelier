module Webhotelier
  module Reservation
    class Response
      attr_reader :result, :resource, :data

      def initialize(resp)
        build_resource(resp)
        @data = resp.body.delete('data')
        @result = resp.body
        self
      end

      def build_resource(resp)
        @resource ||=
          case URI.parse(resp.body['method']).path
          when '/reservation'
            List.new(HashConverter.to_underscore(resp.body['data']))
          when '/reservation/new'
            List.new(HashConverter.to_underscore(resp.body['data']))
          when '/sources'
            Sources.new(HashConverter.to_underscore(resp.body['data']))
          when /^\/reservation\/\d*$/
            Resource.new(HashConverter.to_underscore(resp.body['data']))
          end
      end
    end
  end
end
