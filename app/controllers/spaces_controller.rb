class SpacesController < ApplicationController
  def index
    @user = current_user
    if request.xhr?
      @spaces = Space.where("capacity >=? ", params[:quantity])
      @spaces.near([params[:latitude], params[:logitude]])
      @quantity = params[:quantity]
      puts params
      render partial: 'spaces'

    else
      @spaces = Space.all
    end
  end
  def new
    @user = current_user
    @space = Space.new
    @quantity = params[:quantity]
  end
  def create
    @space = Space.new(space_params)
    @spaces = Space.all
    @space.user_id = params[:user_id]
    respond_to do |format|
      if @space.save
        format.js
      else
        format.html { render :new }
        format.json { render json: @space.errors, status: :unprocessable_entity }
        format.js
      end
    end
    # @space.user_id = params[:user_id]
    # if @space.save
    #   redirect_to user_path(current_user) #need to go to the last space
    # else
    #   render :new
    # end
  end
  def update

    @space = Space.find(params[:id])
    # @user = User.find(params[:user_id])
    # update capacity user
    # @space = @user.spaces.find(params[:id])
    @space.capacity = params[:space][:capacity].to_i
    @space.update_attributes(space_params);
    #respond_to do |format|
      if @space.save
        #format.js
        redirect_to user_path(current_user)
        # redirect_to user_spaces_path
      else
        format.html { render :new }
        format.json { render json: @space.errors, status: :unprocessable_entity }
        format.js
      end
    #end
  end
  def show
    @user = User.find(params[:user_id])
    @space = @user.spaces.find(params[:id])
    render layout: false
  end
  def destroy
    @space = Space.find(params[:id])
    @space.destroy
  end
  private
  def space_params
    params.require(:space).permit(:capacity, :address, :garbaje_day, :user_id)
  end
end
