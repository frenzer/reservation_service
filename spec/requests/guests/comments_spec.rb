require 'rails_helper'

RSpec.describe 'Comments as Guest', type: :request do
  let(:user) { create :user }
  let(:room) { create :room, user: user }
  let!(:comment) { create :comment, room: room, user: user }

  describe '#new' do
    it 'should redirect to sign_in page' do
      get new_room_comment_path(room)
      expect(response).to redirect_to new_user_session_url
    end
  end

  describe '#edit' do
    it 'should redirect to sign_in page' do
      get edit_room_comment_path(room, comment)
      expect(response).to redirect_to new_user_session_url
    end
  end

  describe '#create' do
    let(:comment_attributes) { attributes_for :comment }
    let(:request) { post "/rooms/#{room.id}/comments", params: { comment: comment_attributes } }

    it 'should not create record' do
      expect { request }.not_to change(Comment, :count)
    end

    it 'should redirect to sign_in page' do
      expect(request).to redirect_to new_user_session_url
    end
  end

  describe '#update' do
    let(:comment_attributes) { attributes_for :comment, body: 'New body' }
    let(:request) { patch "/rooms/#{room.id}/comments/#{comment.id}", params: { comment: comment_attributes } }

    it 'should not update record' do
      expect {
        request
        comment.reload
      }.not_to change(comment, :body)
    end

    it 'should redirect to sign_in page' do
      expect(request).to redirect_to new_user_session_url
    end
  end

  describe '#destroy' do
    let(:request) { delete "/rooms/#{room.id}/comments/#{comment.id}" }

    it 'should not delete record' do
      expect { request }.not_to change(Comment, :count)
    end

    it 'should redirect to sign_in page' do
      expect(request).to redirect_to new_user_session_url
    end
  end
end
