class Comment < ApplicationRecord
  belongs_to :room
  belongs_to :user

  scope :order_created_desc, -> { order(created_at: :desc) }

  validates_presence_of :body

  def author?(user)
    self.user == user
  end
end
