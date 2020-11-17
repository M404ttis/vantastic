class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings
  has_many :vans


  validates :username, presence: false#, uniqueness: false, length: { in: 3..15 }
  validates :first_name, presence: false
  validates :last_name, presence: false
end
