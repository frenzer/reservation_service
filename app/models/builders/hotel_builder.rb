module Builders
  class HotelBuilder
    attr_reader :hotel

    def initialize(hotel)
      @hotel = hotel
      reset_free_room_count
    end

    def valid?
      @hotel.valid?
    end

    def add_name(val)
      @hotel.name = val
    end

    def add_room_count(val)
      @hotel.room_count = val
      reset_free_room_count
    end

    def save
      return false unless valid?
      (1..@hotel.room_count).each do |i|
        @hotel.rooms << Room.new(room_number: i, reserved: false)
      end
      @hotel.save
    end

    private
    def reset_free_room_count
      @hotel.free_room_count = @hotel.room_count
    end
  end
end
