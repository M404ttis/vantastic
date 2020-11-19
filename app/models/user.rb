class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :vans
  has_many :offers, through: :vans, source: :bookings
  has_many :bookings

  validates :username, presence: false # , uniqueness: false, length: { in: 3..15 }
  validates :first_name, presence: false
  validates :last_name, presence: false
end
