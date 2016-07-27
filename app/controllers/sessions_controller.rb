class SessionsController < ApplicationController

  def new
  end

  def create
    if @user = login(params[:email], params[:password])
     redirect_back_or_to(user_path(@user), alert: 'LOGIN SUCCESSFUL!')
   else
     flash.now[:alert] = 'LOGIN FAILED!'
     render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to(root_path, alert: 'LOGGED OUT')
  end

end
