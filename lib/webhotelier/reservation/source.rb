module Webhotelier
  module Reservation
    class Sources
      include Enumerable

      class Entry < Struct.new(:id, :name, :is_channel, :parent_id, :is_public)
      end

      attr_reader :data

      def initialize(data)
        @data = data['sources'].map { |j|
          Entry.new(
            j['id'],
            j['name'],
            j['is_channel'],
            j['parent_id'],
            j['is_public']
          )
        }
      end

      def each(&block)
        data.each(&block)
      end
    end
  end
end
