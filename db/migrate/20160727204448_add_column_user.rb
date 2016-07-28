class AddColumnUser < ActiveRecord::Migration
  def change
    add_column :users, :credit_card_number, :integer
    add_column :users, :credit_card_month, :integer
    add_column :users, :credit_card_year, :integer
    add_column :users, :credit_card_verification_value, :integer
    add_column :users, :billing_address, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :zip, :string
  end
end
