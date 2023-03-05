class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, :recoverable, 
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable
  
  has_many :cart_items, dependent: :destroy
end
