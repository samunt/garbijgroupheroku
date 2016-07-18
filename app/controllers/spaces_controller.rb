class SpacesController < ApplicationController
  def index
    @spaces = Space.all
  end

  def new
    @space = Space.new
  end

  def create
    @space = Space.new(space_params)
    if @space.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update

  end

  def show
    @space = Space.find(params[:id])
  end

  def delete
    @space = Space.find(params[:id])
    @space.destroy
  end

  private
  def space_params
    params.require(:space).permit(:capacity, :address, :garbage_day, :user_id)
  end
end
