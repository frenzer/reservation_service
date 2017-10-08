require 'rails_helper'

RSpec.describe Builders::CommentBuilder, type: :model do
  let(:user) { create :user }
  let(:room) { create :room, user: user }
  let(:user2) { create :user }
  let(:valid_comment) { create :comment, user: user, room: room }
  let(:invalid_comment) { build :comment, user: user2, room: room }
  let(:valid_builder) { Builders::CommentBuilder.new(valid_comment) }
  let(:invalid_builder) { Builders::CommentBuilder.new(invalid_comment) }

  context 'if room is reserved by user' do
    it { expect(valid_builder).to be_valid }

    it 'should create comment' do
      expect { valid_builder }.to change(Comment, :count).by(1)
    end
  end

  context 'if room is not reserved by user' do
    it { expect(invalid_builder).not_to be_valid }

    it 'should not create comment' do
      expect { invalid_builder }.not_to change(Comment, :count)
    end
  end
end
