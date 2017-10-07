class Room < ApplicationRecord
  belongs_to :hotel

  validates_presence_of :room_number
end
