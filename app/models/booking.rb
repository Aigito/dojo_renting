class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :dojo_space

  validate :end_after_start
  validates :start_date, :end_date, presence: true

  private

  def end_after_start
    return if end_date.blank? || start_date.blank?

    errors.add(:end_date, "must be after the start date") if end_date < start_date
  end
end
