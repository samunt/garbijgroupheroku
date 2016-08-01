class UsersController < ApplicationController
before_action :require_login, only: [:edit, :update]


  def show
    require_login
    @user = User.find(params[:id])
    @space = Space.new
    @buy_spaces = @user.buy_spaces
    @sell_spaces = @user.sell_spaces
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      # UserMailer.welcome_email(@user).deliver_later
      self.current_user = @user
      redirect_to user_path(@user), alert: 'SIGNED UP!'
    else
      flash[:alert] = "SIGN UP FAILED!"
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
      flash[:notice] = "USER WAS SUCCESSFULLY UPDATED!"
      redirect_to user_path(@user)
    else
      flash[:alert] = "USER NOT SUCCESSFULLY UPDATED"
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :credit_card_number, :credit_card_month, :credit_card_year, :credit_card_verification_value, :billing_address, :city, :state, :zip)
  end

end
