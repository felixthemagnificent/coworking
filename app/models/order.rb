class Order < ActiveRecord::Base
  belongs_to :visit
  has_many :order_details
  has_many :meals, through: :order_details
  
end
