require 'rails_helper'

RSpec.describe Hotel, type: :model do
  it 'has a valid factory' do
    expect(build(:hotel)).to be_valid
  end

  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :room_count }
  it { is_expected.to validate_presence_of :free_room_count }

  context '#update_free_rooms_count' do
    let(:hotel) { create :hotel, room_count: 1, free_room_count: 1 }
    let(:rooms_count) { 4 }
    before do
      rooms_count.times { create :room, hotel: hotel }
    end

    it 'updates free_room_count' do
      expect { hotel.update_free_rooms_count }.to \
        change(hotel, :free_room_count).to(rooms_count)
    end
  end
end
