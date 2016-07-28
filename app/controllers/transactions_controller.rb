class TransactionsController < ApplicationController

  def index
    #@spaces = Space.find(params[:sell_space_id])
    @transactions = Transaction.all

    if request.xhr?
        # @spaces = Space.where("capacity >=? ", params[:quantity])
        # @spaces.near([params[:latitude], params[:logitude]])
        # @quantity = params[:quantity]
        puts "****************" + @quantity
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
    puts "!!!!!!!!!!!!!!!!!!!!!!!!!"
    @user = current_user
    @spaces = Space.all
    @space = Space.find(params[:space_id])
    @quantity = params[:quantity]
    puts @quantity
  end

  def create
    @transaction = Transaction.new(transaction_params)
    @user = current_user
    if @transaction.save
        paymentInfo = ActiveMerchant::Billing::CreditCard.new(
            :number             => '4242424242424242',
            :month              => @user.credit_card_month,
            :year               => @user.credit_card_year,
            :verification_value => @user.credit_card_verification_value)

        purchaseOptions = {:billing_address => {
            :name     => "hkhkh",
            :address1 => "njfkdjsfk",
            :city     => "@user.city",
            :state    => "@user.state",
            :zip      => "@user.zip"
    }}

    response = EXPRESS_GATEWAY.purchase((122 * 2).to_i, paymentInfo, purchaseOptions)

    if response.success? then
      logger.debug "charge successful"
      @space = Space.find(transaction_params[:sell_space_id])
      @transaction.quantity = @space.capacity
      @space.capacity -= @transaction.quantity
      @space.update_attributes(capacity: @space.capacity )
      redirect_to root_path
    else
      render_to root_path
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
    params.require(:transaction).permit(:buy_space_id, :sell_space_id, :total_fee, :transaction_date, :quantity)
  end

end
