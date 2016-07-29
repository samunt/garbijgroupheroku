class Transaction < ActiveRecord::Base


  # validates :buy_space_id, numericality: { only_integer: true }
  # validates :sell_space_id, numericality: { only_integer: true }
  # validates :total_fee, numericality: { only_integer: true }
  # validates :quantity, numericality: { only_integer: true }, length: { in: 1..4 }




  belongs_to :sell_space, class_name: "Space"
  belongs_to :buy_space, class_name: "Space"
  has_one :buy_user, through: :buy_space, :source => 'User'
  has_one :sell_user, through: :sell_space, :source => 'User'

  def update_capacity
    @space.capacity -= @transaction.quantity
  end
end
