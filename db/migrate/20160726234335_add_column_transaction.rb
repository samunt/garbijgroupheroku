class AddColumnTransaction < ActiveRecord::Migration
  def change
    add_column :transactions, :total_amount_cents, :float
  end
end
