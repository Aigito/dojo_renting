class DojoSpace < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings, dependent: :destroy
  has_one_attached :photo
  validates :name, :location, :martial_art, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
