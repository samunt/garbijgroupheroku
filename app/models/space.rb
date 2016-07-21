class Space < ActiveRecord::Base
  has_many :buy_transactions, class_name: 'Transaction', foreign_key: 'buy_space_id'
  has_many :sell_transactions, class_name: 'Transaction', foreign_key: 'sell_space_id'

  geocoded_by :address

  belongs_to :user

end
