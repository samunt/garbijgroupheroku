class User < ActiveRecord::Base
  # Virtual field Credit Card
  attr_accessor :credit_card_number
  attr_accessor :credit_card_month
  attr_accessor :credit_card_year
  attr_accessor :credit_card_verification_value

  authenticates_with_sorcery!
  validates :password, length: { minimum: 3 }
  validates :password, length: { maximum: 20}
  #validates :phone, numericality: { only_integer: true } , length: { minimum: 10 }
  validates :password, confirmation: true
  validates :email, uniqueness: true, presence: true, email_format: { message: 'has invalid format' }
  validates :credit_card_number, numericality: { only_integer: true },  presence: true, length: { is: 16 }
  validates :credit_card_month, numericality: { only_integer: true } , presence: true, length: { is: 2 }
  validates :credit_card_year, numericality: { only_integer: true } , presence: true, length: { in: 2..4 }


  has_many :spaces
  has_many :buy_transactions, through: :spaces
  has_many :sell_transactions, through: :spaces

  def buy_spaces
    self.spaces.where('capacity > 0')
  end

  def sell_spaces
    self.spaces.where('capacity < 0')
  end


  def credit_card_number
    @credit_card_number
  end

  def credit_card_month
    @credit_card_month
  end

  def credit_card_year
    @credit_card_year
  end

  def credit_card_verification_value
    @credit_card_verification_value
  end

  def credit_card_number=(credit_card_number)
     @user.credit_card_number = credit_card_number
  end

  def credit_card_month=(credit_card_month)
    @user.credit_card_month = credit_card_month
  end

  def credit_card_year=(credit_card_year)
    @user.credit_card_year = credit_card_year
  end

  def credit_card_verification_value=(credit_card_verification_value)
    @user.credit_card_verification_value = credit_card_verification_value
  end

end
