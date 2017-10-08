require 'rails_helper'

RSpec.describe Room, type: :model do
  it 'has a valid factory' do
    expect(build(:room)).to be_valid
  end

  it { is_expected.to validate_presence_of :room_number }
end
