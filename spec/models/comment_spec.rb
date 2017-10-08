require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { create :user }
  let(:room) { create :room, user: user }
  it 'has a valid factory' do
    expect(build(:comment, user: user, room: room)).to be_valid
  end

  it { is_expected.to validate_presence_of :body }
end
