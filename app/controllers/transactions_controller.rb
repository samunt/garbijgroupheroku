class TransactionsController < ApplicationController

  def index
    # logic for viewing nearby spaces falls under spaces controller because spaces partial is being rendered
    @transactions = Transaction.all

    if request.xhr?
      # filter geocoder results by capacity greater than quantity
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
    @transaction_price = @quantity
    @user = current_user
    @spaces = Space.all
    @space = Space.find(params[:space_id])
    @quantity = params[:quantity]
    puts @quantity
  end

  def create
    @amount = 500
    @transaction = Transaction.new(transaction_params)
    @user = current_user

      if @transaction.save

        customer = Stripe::Customer.create(
          :email => params[:stripeEmail],
          :source  => params[:stripeToken]
        )

        charge = Stripe::Charge.create(
          :customer    => customer.id,
          :amount      => @amount,
          :description => 'Rails Stripe customer',
          :currency    => 'usd'
        )

          logger.debug "*******CHARGE SUCCESSFULL*********"
          @space = Space.find(transaction_params[:sell_space_id])
          @quantity = params[:quantity].to_s
          @space.capacity -= @transaction.quantity
          @space.update_attributes(capacity: @space.capacity )
          redirect_to user_path(@user)
          @sell_user = User.find(@space.user_id)

          # email pdf
        pdf = render_to_string pdf: "receipt", template: "transactions/show.html.erb", encoding: "UTF-8"
        sell_pdf = render_to_string pdf: "sell_receipt", template: "transactions/sell_show.html.erb", encoding: "UTF-8"
            #sends email containing html in transactions show view and PDF to buy_user
#
        # TransactionMailer.receipt_email_buyer(@user, pdf).deliver_later
        # TransactionMailer.receipt_email_seller(@sell_user, sell_pdf).deliver_later

        flash[:notice] = "Transaction was successfully created! View receipt in your email. "

      else
        # rescue Stripe::CardError => e
        flash[:error] = e.message
        redirect_to edit_user_path(current_user)
        # console.log
      end
  end


  def update
  end

  def delete
    # method not needed for first iteration
    @transaction = Transaction.find(params[:id])
    @transaction.destroy
  end

  private
  def transaction_params
    params.require(:transaction).permit(:buy_space_id, :sell_space_id, :total_fee, :transaction_date, :quantity)
  end

end
