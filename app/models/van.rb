class Van < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :user
  has_one_attached :photo
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  validates :title, presence: true, uniqueness: true, length: { in: 3..30 }
  validates :brand, presence: true
  validates :model, presence: true
  validates :description, presence: true, length: { minimum: 20 }
  # validates :photo, presence: true
  validates :location, presence: true
  validates :price_per_day, presence: true, numericality: { only_integer: true }, inclusion: { in: 20..1000 }

  include PgSearch::Model
  pg_search_scope :search_by_location,
    against: [ :location ],
    using: {
      tsearch: { prefix: true }
    }
end
