class User < ActiveRecord::Base
  authenticates_with_sorcery!

    validates :password, length: { minimum: 3 }
    validates :password, length: { maximum: 20}
    validates :password, confirmation: true

    validates :email, uniqueness: true, presence: true, email_format: { message: 'has invalid format' }

  has_many :spaces
  has_many :buy_transactions, through: :spaces
  has_many :sell_transactions, through: :spaces

  def buy_spaces
    self.spaces.where('capacity > 0')
  end

  def sell_spaces
    self.spaces.where('capacity < 0')
  end





end
