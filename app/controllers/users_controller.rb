class UsersController < ApplicationController
before_action :require_login, only: [:edit, :update]

  def show
    require_login
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      #UserMailer.welcome(@user).deliver_later
      self.current_user = @user
      redirect_to root_path, alert: 'Signed up'
    else
      render :new
    end
  end

  def edit
    require_login
    @user = User.find(params[:id])
  end

  def update
    require_login
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:notice] = "User was successfully updated."
      redirect_to user_path(@user)
    else
      flash[:alert] = "User not successfully updated."
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
