module Webhotelier
  module Reservation

    class List
      include Enumerable
      class Entry < Struct.new(:id, :property, :status); end

      attr_reader :data

      def initialize(data)
        if data
          @data = data['reservations'].map { |j|
            Entry.new(j['id'], j['property'], j['status'])
          }
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
