class ReviewsController < ApplicationController
  def create
    @booking = Booking.find(params[:booking_id])
    @review = Review.new(review_params)
    # @review.booking = @booking
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
