class BookingsController < ApplicationController
  before_action :find_dojo_space, except: %i[accept deny]

  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  # This is for the property owner to accept or decline the booking
  def update
    @booking.update(booking_params)

    redirect_to booking_path(@booking)
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.dojo_space = @dojo_space
    if @booking.save
      redirect_to dojo_space_booking_path(@dojo_space, @booking)
    else
      render :new
    end
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.update(accepted: true)
    redirect_to dashboard_path
  end

  def deny
    @booking = Booking.find(params[:id])
    @booking.update(accepted: false)
    redirect_to dashboard_path
  end

  private

  def find_dojo_space
    @dojo_space = DojoSpace.find(params[:dojo_space_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :accepted)
  end
end
