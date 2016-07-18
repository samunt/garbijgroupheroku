class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :buy_space_id
      t.integer :sell_space_id
      t.float :total_fee
      t.date :transaction_date

      t.timestamps null: false
    end
  end
end
