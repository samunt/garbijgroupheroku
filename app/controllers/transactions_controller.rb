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
        paymentInfo = ActiveMerchant::Billing::CreditCard.new(
                :number             => "4242424242424242",
                :month              => "12",
                :year               => "2020",
                :verification_value => "411")

        purchaseOptions = {:billing_address => {
            :name     => "Customer Name",
            :address1 => "Customer Address Line 1",
            :city     => "Customer City",
            :state    => "Customer State",
            :zip      => "Customer Zip Code"
    }}

    response = EXPRESS_GATEWAY.purchase((17.50 * 100).to_i, paymentInfo, purchaseOptions)

    if response.success? then
      logger.debug "charge successful"
      @space = Space.find(transaction_params[:sell_space_id])
      @space.capacity -= @transaction.quantity
      @space.update_attributes(capacity: @space.capacity )
      redirect_to root_path
    end
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
    params.require(:transaction).permit(:buy_space_id, :sell_space_id, :total_fee, :transaction_date, :quantity, :space_id)
  end

end
