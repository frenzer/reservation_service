require 'rails_helper'

RSpec.describe 'Comments as Admin', type: :request do
  let(:admin) { create :admin }
  let(:user) { create :user }
  let(:room) { create :room, user: user }
  let(:comment) { create :comment, room: room, user: user }

  before { sign_in admin }

  describe '#new' do
    it 'should render new' do
      get new_room_comment_path(room)
      expect(response).to have_http_status(200)
    end
  end

  describe '#edit' do
    it 'should render edit' do
      get edit_room_comment_path(room, comment)
      expect(response).to have_http_status(200)
    end
  end

  describe '#create' do
    let(:comment_attributes) { attributes_for :comment }
    let(:request) { post "/rooms/#{room.id}/comments", params: { comment: comment_attributes } }

    it 'should create record' do
      expect { request }.to change(Comment, :count).by(1)
    end
  end

  describe '#update' do
    let(:comment_attributes) { attributes_for :comment, body: 'New body' }
    let(:request) { patch "/rooms/#{room.id}/comments/#{comment.id}", params: { comment: comment_attributes } }

    it 'should update record' do
      expect {
        request
        comment.reload
      }.to change(comment, :body)
    end
  end

  describe '#destroy' do
    let(:request) { delete "/rooms/#{room.id}/comments/#{comment.id}" }

    it 'should delete record' do
      comment
      expect { request }.to change(Comment, :count).by(-1)
    end
  end
end
