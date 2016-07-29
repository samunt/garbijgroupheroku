class ChangeOrderNameTable < ActiveRecord::Migration
  def change
    rename_table :Order, :order
  end
end
