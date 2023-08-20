class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :user_stocks
  has_many :stocks, through: :user_stocks
  has_many :friendships
  has_many :friends, through: :friendships
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
    def already_tracking_stock?(ticker_symbol)
      stock = Stock.find_stock_db(ticker_symbol)
      return false unless stock
      self.stocks.where(id: stock.id).any?
    end

    def under_stock_limit?
      stocks.count < 10
    end

    def can_track_stock?(ticker_symbol)
      under_stock_limit? && !already_tracking_stock?(ticker_symbol)
    end

    def full_name
     return "#{first_name} #{last_name}" if first_name || last_name
     "Anonymous"
    end
end
