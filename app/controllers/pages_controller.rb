class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @dojo_spaces = DojoSpace.all
  end

  def dashboard
  end
end
