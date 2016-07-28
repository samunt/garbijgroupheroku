class ChangeCreditCardNumber < ActiveRecord::Migration
  def change
    change_column :users, :credit_card_number, :string
  end
end
