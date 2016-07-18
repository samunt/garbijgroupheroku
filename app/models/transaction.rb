class Transaction < ActiveRecord::Base
  belongs_to :sell_space, class_name: "Space"
  belongs_to :buy_space, class_name: "Space"
  has_one :buy_user, through: :buy_space, :source => 'User'
  has_one :sell_user, through: :sell_space, :source => 'User'
end
