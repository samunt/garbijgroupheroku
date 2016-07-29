class Order < ActiveRecord::Base
  #
  # create_table "Orders", force: :cascade do |t|
  #   t.integer  "transaction_id"
  #   t.string   "ip"
  #   t.string   "express_token"
  #   t.string   "express_payer_id"
  #   t.datetime "created_at",       null: false
  #   t.datetime "updated_at",       null: false
  #   t.integer  "cart_id"
  validates :transaction_id, numericality: { only_integer: true }

  belongs_to :owner, foreign_key: "transaction_id", class_name: "Transaction"

 def purchase
   response = EXPRESS_GATEWAY.purchase(order.total_amount_cents, express_purchase_options)
   cart.update_attribute(:purchased_at, Time.now) if response.success?
   response.success?
 end

 def express_token=(token)
   self[:express_token] = token
   if new_record? && !token.blank?
     # you can dump details var if you need more info from buyer
     details = EXPRESS_GATEWAY.details_for(token)
     self.express_payer_id = details.payer_id
   end
 end

 private

 def express_purchase_options
   {
     :ip => ip,
     :token => express_token,
     :payer_id => express_payer_id
   }
 end
end
