class DojoSpacesController < ApplicationController
  before_action :find_dojo_space, only: %i[show edit update destroy]

  def index
    @dojo_spaces = DojoSpace.all
  end

  def show
  end

  def edit
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
    params.require(:dojo_space).permit(:name, :price, :location, :martial_art)
  end
end
