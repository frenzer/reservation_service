class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, :recoverable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable

  #validates :email, presence: true, uniqueness: true
  validates_presence_of :firstname, :lastname #, :password

  def full_name
    [firstname, lastname].compact.join(' ')
  end
end
