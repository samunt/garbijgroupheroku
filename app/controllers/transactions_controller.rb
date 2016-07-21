class TransactionsController < ApplicationController

  def index
    @spaces = Space.find(params[:sell_space_id])
    @transactions = Transaction.all
  end

  def show
    @transaction = Transaction.find(params[:id])
  end

  def new
    @transaction = Transaction.new
  
    # @space = @user.spaces.first
    # @space.capacity = params[:space][:capacity].to_i
  end

  def create
    @transaction = Transaction.new(transaction_params)

    if @transaction.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
  end

  def delete
    @transaction = Transaction.find(params[:id])
    @transaction.destroy
  end

  private
  def transaction_params
    params.require(:transaction).permit(:buy_space_id, :sell_space_id, :total_fee, :transaction_date)
  end

end
