class Van < ApplicationRecord
  has_many :bookings
  belongs_to :user
  has_one_attached :photo

  validates :title, presence: true, uniqueness: true, length: { in: 3..30 }
  validates :brand, presence: true
  validates :model, presence: true
  validates :description, presence: true, length: { minimum: 20 }
  # validates :photo, presence: true
  validates :location, presence: true
  validates :price_per_day, presence: true, numericality: { only_integer: true }, inclusion: { in: 20..1000 }
end
