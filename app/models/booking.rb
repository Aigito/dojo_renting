class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :dojo_space
  has_many :reviews, dependent: :destroy

  validate :end_after_start
  validate :booking_date_before_today
  validates :start_date, :end_date, presence: true

  private

  def end_after_start
    return if end_date.blank? || start_date.blank?

    errors.add(:end_date, "must be after the start date") if end_date < start_date
  end

  def booking_date_before_today
    errors.add(:start_date, "must be after today") if start_date <= Date.today
    errors.add(:end_date, "must be after today") if end_date <= Date.today
  end
end
