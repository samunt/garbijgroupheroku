class OrdersController < ApplicationController

  def express_checkout
    @user = current_user
    paymentInfo = ActiveMerchant::Billing::CreditCard.new(
            :number             => @user.credit_card_number,
            :month              => @user.credit_card_month,
            :year               => @user.credit_card_year,
            :verification_value => @user.credit_card_verification_value)

    purchaseOptions = {:billing_address => {
        :name     => @user.name,
        :address1 => @user.billing_address,
        :city     => @user.city,
        :state    => @user.state,
        :zip      => @user.zip
}}

response = EXPRESS_GATEWAY.purchase((@transaction.quantity * 2).to_i, paymentInfo, purchaseOptions)

if response.success? then
  logger.debug "charge successful"
  redirect_to root_path
end

    # response = EXPRESS_GATEWAY.setup_purchase(1000,
    #   ip: request.remote_ip,
    #   return_url: root_path,
    #   cancel_return_url: root_path,
    #   currency: "USD",
    #   allow_guest_checkout: true,
    #   items: [{name: "Order", description: "Order description", quantity: "1", amount: 1000}]
    # )
    # redirect_to EXPRESS_GATEWAY.redirect_url_for(response.token)
  end

  def new
    @order = Order.new(:express_token => params[:token])
  end

  def create
    @order = @cart.build_order(order_params)
    @order.ip = request.remote_ip

    if @order.save
      if @order.purchase # this is where we purchase the order. refer to the model method below
        redirect_to order_url(@order)
      else
        render :action => "failure"
      end
    else
      render :action => 'new'
    end
  end
end
