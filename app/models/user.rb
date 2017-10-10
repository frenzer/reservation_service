class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, :recoverable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable

  has_many :rooms
  has_many :comments

  validates_presence_of :firstname, :lastname

  def full_name
    [firstname, lastname].join(' ')
  end
end
