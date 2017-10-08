require 'rails_helper'

RSpec.describe 'Comments as User', type: :request do
  let(:user) { create :user }
  let(:room) { create :room, user: user }
  let(:comment) { create :comment, room: room, user: user }
  let(:other_comment) { create :comment }
  let(:other_room) { other_comment.room }

  before { sign_in user }

  describe '#new' do
    context 'user reserved room' do
      it 'should render new' do
        get new_room_comment_path(room)
        expect(response).to have_http_status(200)
      end
    end
  end

  describe '#edit' do
    context 'if user author of the comment' do
      it 'should render edit' do
        get edit_room_comment_path(room, comment)
        expect(response).to have_http_status(200)
      end
    end

    context 'if user not author of the comment' do
      it 'should redirect with access error' do
        get edit_room_comment_path(other_room, other_comment)
        expect(response).to redirect_to root_url
      end
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

    context 'if user author of the comment' do
      let(:request) { patch "/rooms/#{room.id}/comments/#{comment.id}", params: { comment: comment_attributes } }

      it 'should update record' do
        expect {
          request
          comment.reload
        }.to change(comment, :body)
      end
    end

    context 'if user not author of the comment' do
      let(:request) { patch "/rooms/#{other_room.id}/comments/#{other_comment.id}", params: { comment: comment_attributes } }

      it 'should not update record' do
        expect {
          request
          other_comment.reload
        }.not_to change(other_comment, :body)
      end

      it 'should redirect with access error' do
        expect(request).to redirect_to root_url
      end
    end
  end

  describe '#destroy' do
    context 'if user author of the comment' do
      let(:request) { delete "/rooms/#{room.id}/comments/#{comment.id}" }

      it 'should delete record' do
        comment
        expect { request }.to change(Comment, :count).by(-1)
      end
    end

    context 'if user not author of the comment' do
      let(:request) { delete "/rooms/#{other_room.id}/comments/#{other_comment.id}" }
      it 'should not delete record' do
        other_comment
        expect { request }.not_to change(Comment, :count)
      end

      it 'should redirect with access error' do
        expect(request).to redirect_to root_url
      end
    end
  end
end
