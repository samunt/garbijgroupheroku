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
    #puts @space
    #debug(space_params)

    @space.user_id = params[:user_id]
    if @space.save
      redirect_to user_path(current_user) #need to go to the last space
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:user_id])
    # update capacity user
    @space = @user.spaces.first
    @space.capacity = params[:space][:capacity].to_i
    if @space.save
      redirect_to user_path(current_user)
    end

  end

  def show
    @user = User.find(params[:user_id])
    @space = @user.spaces.find(params[:id])
  end

  def destroy
    @space = Space.find(params[:id])
    @space.destroy

    respond_to do |format|
      format.html { redirect_to user_path(current_user) }
      format.xml  { head :ok }
    end
  end

  private
  def space_params
    params.require(:space).permit(:capacity, :address, :garbaje_day, :user_id)
  end
end
