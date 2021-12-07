class Review < ApplicationRecord
  belongs_to :booking
  # belongs_to :dojo_space

  validates :content, presence: true
  validates :rating, presence: true, numericality: { greater_than: -1, less_than: 6 }
end
