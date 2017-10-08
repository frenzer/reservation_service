require 'rails_helper'

RSpec.describe 'Rooms as Guest', type: :request do
  let(:room) { create :room }

  describe '#show' do
    it 'should redirect to sign_in page' do
      get room_path(room)
      expect(response).to redirect_to new_user_session_url
    end
  end

  describe '#reserve' do
    let(:prev_url) { room_url(room) }
    let(:request) { get reserve_room_path(room) }

    it 'should not reserve room' do
      expect {
        request
        room.reload
      }.not_to change(room, :reserved)
    end

    it 'should redirect to sign_in page' do
      request
      expect(response).to redirect_to new_user_session_url
    end
  end

  describe '#cancel_reservation' do
    let(:reserved_room) { create :reserved_room }
    let(:request) { get cancel_reservation_room_path(reserved_room) }

    it 'should not cancel room reservation' do
      expect {
        request
        reserved_room.reload
      }.not_to change(reserved_room, :reserved)
    end

    it 'should redirect to sign_in page' do
      request
      expect(response).to redirect_to new_user_session_url
    end
  end
end
