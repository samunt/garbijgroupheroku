class TransactionsController < ApplicationController

  def index
    #@spaces = Space.find(params[:sell_space_id])
    @transactions = Transaction.all

    if request.xhr?
      # @spaces.near([params[:latitude], params[:logitude]])
        # @spaces = Space.all
        # @params = params

        @spaces = Space.where(capacity: params[:quantity])
        # render layout: false
    else
      @spaces = Space.all
    end

    render layout: false
    # @user = User.find(params[:id])
  end

  def show
    @transaction = Transaction.find(params[:id])
  end

  def new
    @transaction = Transaction.new
    @user = User.find_by id: '1'
    @space = @user.spaces[0]
    # @space = @user.spaces.first
    #@space = current_user.spaces
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
