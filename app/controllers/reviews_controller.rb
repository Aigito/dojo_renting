class ReviewsController < ApplicationController
before_action :find_dojo_space, :find_booking

  def new
    @review = Review.new
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @review = Review.new(review_params)

    # @dojo_space = DojoSpace.new(dojo_space_params)
    @review.booking_id = @booking.id
    if @review.save
      redirect_to dojo_space_path(@dojo_space)
    else
      render :new
    end
    # @review.booking = @booking
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def find_dojo_space
    @dojo_space = DojoSpace.find(params[:dojo_space_id])
  end

  def find_booking
    @booking = Booking.find(params[:booking_id])
  end
end
