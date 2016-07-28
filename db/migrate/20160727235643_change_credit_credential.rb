class ChangeCreditCredential < ActiveRecord::Migration
  def change
    change_column :users, :credit_card_month, :string
    change_column :users, :credit_card_year, :string
    change_column :users, :credit_card_verification_value, :string
  end
end
