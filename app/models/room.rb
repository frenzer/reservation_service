class Room < ApplicationRecord
  belongs_to :hotel
  belongs_to :user, optional: true
  has_many :comments

  validates_presence_of :room_number
end
