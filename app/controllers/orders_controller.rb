class OrdersController < ApplicationController

  def express_checkout
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
