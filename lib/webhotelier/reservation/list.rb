module Webhotelier
  module Reservation
    class List
      include Enumerable
      Entry = Struct.new(:id, :property, :status, :resource) do

      end

      attr_reader :data, :raw_data

      def initialize(raw_data = nil)
        @raw_data = raw_data
        if raw_data
          @data = Array(raw_data['reservations']).lazy.map do |j|
            Entry.new(
              j['id'],
              j['property'],
              j['status'],
              Resource.new(HashConverter.to_underscore(j))
            )
          end
        else
          @data = []
        end
      end

      def each(&block)
        data.each(&block)
      end
    end
  end
end
