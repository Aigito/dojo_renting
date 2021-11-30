class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :dojo_space

  validates :start_date, numericality: { less_than: :end_date }
  validates :end_date, numericality: { greater_than: :start_date }
end
