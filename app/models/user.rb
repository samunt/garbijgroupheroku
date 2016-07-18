class User < ActiveRecord::Base

  has_many :spaces
  has_many :buy_transactions, through: :spaces
  has_many :sell_transactions, through: :spaces  

  def buy_spaces
    self.spaces.where('capacity > 0')
  end

  def sell_spaces
    self.spaces.where('capacity <= 0')
  end


end
