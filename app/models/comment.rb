class Comment < ApplicationRecord
  belongs_to :room
  belongs_to :user

  validates_presence_of :body
  validate :room_reserved_by_user, on: :create

  def author?(_user)
    user == _user
  end

  private
  def room_reserved_by_user
    return true if room.reserved_by?(user)
    errors.add(:user, 'Room should be reserved by user')
  end
end
