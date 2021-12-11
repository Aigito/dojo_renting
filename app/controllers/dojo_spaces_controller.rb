class DojoSpacesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :find_dojo_space, only: %i[show edit update destroy]

  def index
    if params[:query].present?
      @dojo_spaces = DojoSpace.search_by_location_martial_art_name(params[:query])
    else
      @dojo_spaces = DojoSpace.all
    end

  end

  def show
    @reviews = Review.all
  end

  def edit
    if @dojo_space.user == current_user
      render :edit
    else
      render :show
    end
  end

  def update
    @dojo_space.update(dojo_space_params)

    redirect_to dojo_space_path(@dojo_space)
  end

  def new
    @dojo_space = DojoSpace.new
  end

  def create
    @dojo_space = DojoSpace.new(dojo_space_params)
    @dojo_space.user = current_user
    if @dojo_space.save
      redirect_to dojo_space_path(@dojo_space)
    else
      render :new
    end
  end

  def destroy
    @dojo_space.destroy
    redirect_to root_path
  end

  private


  def find_dojo_space
    @dojo_space = DojoSpace.find(params[:id])
  end

  def dojo_space_params
    params.require(:dojo_space).permit(:name, :price, :location, :martial_art, photos: [])
  end
end
