class SessionsController < ApplicationController

  def new
  end

  def create
    if @user = login(params[:email], params[:password])
     redirect_back_or_to(user_path(@user), alert: 'Login successful!')
   else
     flash.now[:alert] = 'Login failed!'
     render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to(root_path, alert: 'Logged out')
  end

end
