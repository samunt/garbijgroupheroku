class DropOrderModel < ActiveRecord::Migration
  def change
    drop_table :Orders
  end
end
