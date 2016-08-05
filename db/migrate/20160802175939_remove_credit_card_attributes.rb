class RemoveCreditCardAttributes < ActiveRecord::Migration
  def change
    remove_column :users, :credit_card_number, :string
    remove_column :users, :credit_card_month, :string
    remove_column :users, :credit_card_year, :string
    remove_column :users, :credit_card_verification_value, :string
  end
end
