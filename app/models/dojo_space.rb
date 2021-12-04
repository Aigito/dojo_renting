class DojoSpace < ApplicationRecord
  require 'pg_search'
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings, dependent: :destroy

  validates :name, :location, :martial_art, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }

  include PgSearch::Model
  pg_search_scope :search_by_location,
  against: [ :location ],
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }
end
