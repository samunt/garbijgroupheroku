class SpacesController < ApplicationController
  def index
    @spaces = Space.all
  end

  def new
    @user = current_user
    @space = Space.new
  end

  def create
    @space = Space.new(space_params)
    @space.user_id = params[:user_id]
    if @space.save
      redirect_to user_space_path #need to go to the last space
    else
      render :new
    end
  end

  def update

  end

  def show
    @user = User.find(params[:user_id])
    @space = @user.spaces.find(params[:id])
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
