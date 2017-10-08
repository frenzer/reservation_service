require 'rails_helper'

RSpec.describe 'Hotels as Guest', type: :request do
  describe '#index' do
    it 'can view list of hotels' do
      get hotels_path
      expect(response).to have_http_status(200)
    end
  end

  describe '#show' do
    let(:hotel) { create :hotel }

    it 'should redirect to sign_in page' do
      get hotel_path(hotel)
      expect(response).to redirect_to new_user_session_url
    end
  end

  describe '#new' do
    it 'should redirect to sign_in page' do
      get new_hotel_path
      expect(response).to redirect_to new_user_session_url
    end
  end

  describe '#create' do
    let(:hotel_attributes) { attributes_for :hotel }
    let(:request) { post '/hotels', params: { hotel: hotel_attributes } }

    it 'should not create hotel' do
      expect { request }.not_to change(Hotel, :count)
    end

    it 'should redirect to sign_in page' do
      request
      expect(response).to redirect_to new_user_session_url
    end
  end

  describe '#destroy' do
    let!(:hotel) { create :hotel }
    let(:request) { delete "/hotels/#{hotel.id}" }

    it 'should not destroy hotel' do
      expect { request }.not_to change(Hotel, :count)
    end

    it 'should redirect to sign_in page' do
      request
      expect(response).to redirect_to new_user_session_url
    end
  end
end
