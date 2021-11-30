class DojoSpace < ApplicationRecord
  belongs_to :user
  has_many :reviews

  validates :name, :location, :martial_art, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
