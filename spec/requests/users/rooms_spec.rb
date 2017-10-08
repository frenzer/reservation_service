require 'rails_helper'

RSpec.describe 'Rooms as User', type: :request do
  let(:user) { create :user }
  let(:room) { create :room }
  before { sign_in user }

  describe '#show' do
    it 'should show room page' do
      get room_path(room)
      expect(response).to have_http_status(200)
    end
  end

  describe '#reserve' do
    let(:request) { get reserve_room_path(room) }

    it 'should not reserve room' do
      expect {
        request
        room.reload
      }.to change(room, :reserved).from(false).to(true)
    end
  end

  describe '#cancel_reservation' do
    let(:prev_url) { room_url(room) }
    let(:reserved_room) { create :reserved_room }
    let(:request) { get cancel_reservation_room_path(reserved_room) }

    it 'should cancel room reservation' do
      expect {
        request
        reserved_room.reload
      }.not_to change(reserved_room, :reserved)
    end

    it 'should redirect with access error'  do
      expect(request).to redirect_to root_url
    end
  end
end
