class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @dojo_spaces = DojoSpace.all.order('martial_art', 'price')
  end

  def dashboard
    @dojo_spaces = DojoSpace.all
    @bookings = Booking.all.order('id')
  end
end
