class WelcomeController < ApplicationController

  def index
    @user = User.new
    @homepage = true
  end


end
