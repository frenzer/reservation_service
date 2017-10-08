require 'rails_helper'

RSpec.describe Builders::HotelBuilder, type: :model do
  let(:room_count) { 3 }
  let(:hotel) { create :hotel, room_count: room_count }

  it 'creates correct number of rooms' do
    expect { Builders::HotelBuilder.new(hotel).save }.to change(Room, :count).by(room_count)
  end
end
