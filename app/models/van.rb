class Van < ApplicationRecord
  has_many :bookings
  belongs_to :user

  validates :title, presence: true, uniqueness: true, length: { in: 3..30 }
  validates :description, presence: true, length: { min: 100 }
  validates :photo, presence: true
  validates :price_per_day, presence: true, numericality: { only_integer: true }

end
