class TransactionsController < ApplicationController

  def index
    #@spaces = Space.find(params[:sell_space_id])
    # logic for viewing nearby spaces falls under spaces controller because spaces partial is being rendered
    @transactions = Transaction.all

    if request.xhr?
        @spaces = Space.where("capacity >=? ", params[:quantity])
        @spaces.near([params[:latitude], params[:logitude]])
        @quantity = params[:quantity]
        @spaces = Space.all
        @params = params
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
    @quantity = params[:quantity]
    puts @quantity
  end

  def create
    @transaction = Transaction.new(transaction_params)
    @user = current_user
    if @transaction.save

        #sends email containing html in transactions show view and PDF to buy_user
        # TransactionMailer.receipt_email(@user).deliver_later

        # payment info of user entered for activemerchant
        paymentInfo = ActiveMerchant::Billing::CreditCard.new(
            :number             => '4242424242424242',
            :month              => @user.credit_card_month,
            :year               => @user.credit_card_year,
            :verification_value => @user.credit_card_verification_value)

        #is this necessary?
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
      redirect_to user_path(@user)
      @sell_user = User.find(@space.user_id)
      puts "*****************" + @sell_user.first_name


      pdf = render_to_string pdf: "receipt", template: "transactions/show.html.erb", encoding: "UTF-8"
      sell_pdf = render_to_string pdf: "sell_receipt", template: "transactions/sell_show.html.erb", encoding: "UTF-8"
      #sends email containing html in transactions show view and PDF to buy_user
      TransactionMailer.receipt_email_buyer(@user, pdf).deliver_later
      TransactionMailer.receipt_email_seller(@sell_user, sell_pdf).deliver_later

      flash[:notice] = "Transaction was successfully created! View receipt in your email. "
      #redirect_to users_path(current_user)
      #goes to transactions show view and converts HTML to PDF

      # pdf = render_to_string pdf: "receipt", template: "transactions/show.html.erb", encoding: "UTF-8"
      # saves PDF to tmp file, which is git ignored
      # tmp_path = Rails.root.join('tmp','receipt.pdf')

      # saves PDF to tmp file, which is git ignored

      # File.open(tmp_path, 'wb') do |file|
      #   file << pdf
      # end

    else
      flash[:alert] = "Whoops, check your payment credentials and try again!"
      redirect_to edit_user_path(current_user)
      console.log
    end
    # else
    #   render :new
    # end
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
