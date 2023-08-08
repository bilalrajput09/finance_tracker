class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :user_stocks
  has_many :stocks, through: :user_stocks
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
