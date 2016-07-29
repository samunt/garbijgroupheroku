class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :transaction_id
      t.string :ip
      t.string :express_token
      t.string :express_payer_id
      t.integer :cart_id

      t.timestamps null: false
    end
  end
end
