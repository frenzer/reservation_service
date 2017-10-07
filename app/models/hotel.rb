class Hotel < ApplicationRecord
  has_many :rooms, dependent: :destroy

  validates_presence_of :name
  validates :room_count, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :free_room_count, presence: true, numericality: { greater_than_or_equal_to: 0 }

  def reserved_room_count
    room_count - free_room_count
  end
end
