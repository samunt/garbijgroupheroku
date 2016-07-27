class TransactionsController < ApplicationController

  def index
    #@spaces = Space.find(params[:sell_space_id])
    @transactions = Transaction.all

    if request.xhr?
        @spaces = Space.where("capacity >=? ", params[:quantity])
        @spaces.near([params[:latitude], params[:logitude]])
        # @spaces = Space.all
        # @params = params
    else
      @spaces = Space.all
    end
  end

  def show
    @transaction = Transaction.find(params[:id])
  end

  def new
    @transaction = Transaction.new
    @user = current_user
    @spaces = Space.all
    @space = Space.find(params[:space_id])
  end

  def create
    @transaction = Transaction.new(transaction_params)
    if @transaction.save
      @space = Space.find(params[:space_id])
      @space.capacity -= @transaction.quantity
      @space.update_attributes(capacity: @space.capacity )
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
    params.require(:transaction).permit(:buy_space_id, :sell_space_id, :total_fee, :transaction_date, :quantity)
  end

end
