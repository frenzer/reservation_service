require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a valid factory' do
    expect(build(:user)).to be_valid
  end

  it { is_expected.to validate_presence_of :firstname }
  it { is_expected.to validate_presence_of :lastname }

  context '#full_name' do
    let(:user) {create :user, firstname: 'John', lastname: 'Doe'}
    it 'returns user full name' do
      expect(user.full_name).to eq('John Doe')
    end
  end
end
