class Comment < ApplicationRecord
  belongs_to :room
  belongs_to :user

  validates_presence_of :body

  def author?(_user)
    user == _user
  end
end
