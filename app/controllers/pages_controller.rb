class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @dojo_spaces = DojoSpace.all.order('martial_art', 'price')

    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    @markers = @dojo_spaces.geocoded.map do |dojospace|
      {
        lat: dojospace.latitude,
        lng: dojospace.longitude,
        info_window: render_to_string(partial: "info_window", locals: { dojospace: dojospace })
      }
    end

  end

  def dashboard
    @dojo_spaces = DojoSpace.all.order('martial_art', 'price')
    @bookings = Booking.all.order('id')
  end
end
