class ChangeAttributeCartId < ActiveRecord::Migration
  def change
    rename_column :Orders, :cart_id, :transaction_id
  end
end
