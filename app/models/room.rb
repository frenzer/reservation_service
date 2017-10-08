class Room < ApplicationRecord
  belongs_to :hotel
  belongs_to :user, optional: true

  validates_presence_of :room_number
end
