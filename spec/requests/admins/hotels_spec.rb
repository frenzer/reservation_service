require 'rails_helper'

RSpec.describe 'Hotels as Admin', type: :request do
  let(:admin) { create :admin }

  before { sign_in admin }

  describe '#index' do
    it 'should show list of hotels' do
      get hotels_path
      expect(response).to have_http_status(200)
    end
  end

  describe '#new' do
    it 'should show form for new' do
      get new_hotel_path
      expect(response).to have_http_status(200)
    end
  end

  describe '#create' do
    let(:hotel_attributes) { attributes_for :hotel }
    let(:request) { post '/hotels', params: { hotel: hotel_attributes } }

    it 'should create hotel' do
      expect { request }.to change(Hotel, :count).by(1)
    end
  end

  describe '#destroy' do
    let!(:hotel) { create :hotel }
    let(:request) { delete "/hotels/#{hotel.id}" }

    it 'should destroy hotel' do
      expect { request }.to change(Hotel, :count).by(-1)
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
