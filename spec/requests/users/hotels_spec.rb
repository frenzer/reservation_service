require 'rails_helper'

RSpec.describe 'Hotels as User', type: :request do
  let(:user) { create :user }

  before { sign_in user }

  describe '#index' do
    it 'should show list of hotels' do
      get hotels_path
      expect(response).to have_http_status(200)
    end
  end

  describe '#new' do
    it 'should redirect with access error' do
      get new_hotel_path
      expect(response).to redirect_to root_url
    end
  end

  describe '#create' do
    let(:hotel_attributes) { attributes_for :hotel }
    let(:request) { post '/hotels', params: { hotel: hotel_attributes } }

    it 'should not create hotel' do
      expect { request }.not_to change(Hotel, :count)
    end

    it 'should redirect with access error' do
      expect(request).to redirect_to root_url
    end
  end

  describe '#destroy' do
    let!(:hotel) { create :hotel }
    let(:request) { delete "/hotels/#{hotel.id}" }

    it 'should not destroy hotel' do
      expect { request }.not_to change(Hotel, :count)
    end

    it 'should redirect with access error' do
      expect(request).to redirect_to root_url
    end
  end

  describe '#show' do
    let(:hotel) { create :hotel }

    it 'should show hotel page' do
      get hotel_path(hotel)
      expect(response).to have_http_status(200)
    end
  end
end
