class Space < ActiveRecord::Base

  #validates :capacity, numericality: { only_integer: true }
  validates :address, presence: true
  #validates :user_id, numericality: { only_integer: true }
  #validates :latitude, numericality: { only_integer: true }



  has_many :buy_transactions, class_name: 'Transaction', foreign_key: 'buy_space_id'
  has_many :sell_transactions, class_name: 'Transaction', foreign_key: 'sell_space_id'

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  belongs_to :user

end
