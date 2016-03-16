module Webhotelier
  module Reservation
    class Resource
      class ClientInfo
        include Virtus.model
        attribute :first_name, String
        attribute :last_name, String
        attribute :email, String
        attribute :tel, String
        attribute :country, String
        attribute :address, String
        attribute :postal, String
        attribute :location, String
        attribute :region, String
        attribute :company, String
        attribute :purpose, String
        attribute :remarks, String
      end

      class RoomStay
        include Virtus.model
        attribute :roomType, String
        attribute :roomName, String
        attribute :rateName, String
        attribute :rateDesc, String
        attribute :rateID, Integer
        attribute :board, :Integer
        attribute :externalRateInfo, String
        attribute :rooms, Integer
        attribute :from, DateTime
        attribute :to, DateTime
      end

      class Pricing
        include Virtus.model
        attribute :price, Float
        attribute :sub_total, Float
        attribute :extras, Float
        attribute :taxes, Float
        attribute :currency, String
      end

      class BookInfo
        include Virtus.model
        attribute :book_date, DateTime
        attribute :booking_code, String
        attribute :voucher_code, String
        attribute :referer, String
        attribute :source, String
        attribute :source_id, Integer
        attribute :agent, String
        attribute :agent_id, Integer
        attribute :remote_ip, String
        attribute :remote_country, String
      end


      class Constraints
        include Virtus.model
        attribute :min_stay, Integer
        attribute :max_stay, Integer
        attribute :free_cancel_days, Integer
        attribute :free_cancel_expiry, String
      end

      class Policies
        include Virtus.model
        attribute :cancellation, String
        attribute :payment, String
      end

      class Rate
        include Virtus.model
        attribute :date, String
        attribute :price, Float
        attribute :price_with_tax, Float
      end

      class Room
        include Virtus.model
        attribute :room_no, Integer
        attribute :adults, Integer
        attribute :children, Integer
        attribute :infants, Integer
        attribute :rates, Array(Rate)
        attribute :price, Float
        attribute :price_with_tax, Float
      end

      class ExtraPrice
        include Virtus.model
        attribute :unit_price, Float
        attribute :per_room, Boolean
        attribute :per_day, Boolean
        attribute :per_adult, Boolean#, // 1=True, 0=False
        attribute :per_child, Boolean#, // 1=True, 0=False
        attribute :per_infant, Boolean# // 1=True, 0=False
      end

      class Extra
        include Virtus.model
        attribute :id, Integer
        attribute :name, String
        attribute :quantity, Integer
        attribute :price, Float # , // Total extra price
        attribute :pricing, ExtraPrice
      end

      class Tax
        include Virtus.model
        attribute :order, Integer
        attribute :description, String
        attribute :included, Boolean #, // 1=True, 0=False
        attribute :type, String
        attribute :pricing, ExtraPrice
      end

      class Preference
        include Virtus.model
        attribute :id, Integer
        attribute :type, String
        attribute :name, String
        attribute :title, String
        attribute :value, String
      end

      class Change
        include Virtus.model
        attribute :user_type, String
        attribute :user_name, String
        attribute :date, String
        attribute :type, String
      end

      include Virtus.model
      attribute :id, String
      attribute :property, String
      attribute :property_name, String
      attribute :infourl, String
      attribute :room_stay, RoomStay
      attribute :pricing, Pricing
      attribute :book_info, BookInfo
      attribute :client_info, ClientInfo
      attribute :guest_names, Array(String)
      attribute :status, String
      attribute :offline, String
      attribute :constraints, Constraints
      attribute :policies, Policies
      attribute :rooms, Array(Room)
      attribute :changes, Array(Change)
      attribute :preferences, Array(Preference)
      attribute :taxes, String
      attribute :extras, Array(Extra)
      attribute :special_requests, String
    end
  end
end
