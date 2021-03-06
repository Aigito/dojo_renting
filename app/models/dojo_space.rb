class DojoSpace < ApplicationRecord
  require 'pg_search'
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings, dependent: :destroy
  has_many_attached :photos
  validates :name, :location, :martial_art, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }

  include PgSearch::Model
  pg_search_scope :search_by_location_martial_art_name,
  against: [ :location, :martial_art, :name ],
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
