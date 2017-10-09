class Room < ApplicationRecord
  belongs_to :hotel
  belongs_to :user, optional: true
  has_many :comments, dependent: :destroy

  scope :order_by_reserved_and_name, -> { order(reserved: :asc, room_number: :asc) }

  default_scope { order_by_reserved_and_name }

  validates_presence_of :room_number

  def reserved_by?(user)
    self.user == user
  end
end
