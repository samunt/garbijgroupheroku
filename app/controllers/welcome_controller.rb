class WelcomeController < ApplicationController

  def index
    @user = User.new
    @homepage = true
<<<<<<< HEAD
    # @transaction_money = Transaction.all
    # @sum = 0.0 #counter for the how much we saved you line on the welcome page
    # @transaction_money.each do |x|
    #    @sum += x.total_fee
    # end
=======
    @transaction_money = Transaction.all

    @sum = 0.0 #counter for the how much we saved you line on the welcome page
    # @transaction_money.each do |x|
    #    @sum += x.total_fee
    # end

>>>>>>> master
  end

end
