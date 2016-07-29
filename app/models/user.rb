class User < ActiveRecord::Base
  authenticates_with_sorcery!

    # validates :password, length: { minimum: 3 }, message: 'Password must be at least 3 characters long'
    # validates :password, length: { maximum: 20}, message: 'Password must be at most 20 characters long'
    # validates :password, confirmation: true
    # validates :email, uniqueness: true, presence: true, email_format: { message: 'has invalid format' }
    # validates :phone, numericality: { only_integer: true } , length: { minimum: 10 }, message: 'Phone number must be at least 10 digits'
    # validates :credit_card_number, numericality: { only_integer: true },  presence: true, length: { is: 16 }
    # validates :credit_card_month, numericality: { only_integer: true } , presence: true, length: { is: 2 }
    # validates :credit_card_year, numericality: { only_integer: true } , presence: true, length: { in: 2..4 }
    # validates :credit_card_verification_value, numericality: { only_integer: true } , presence: true, length: { is: 3 }

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
