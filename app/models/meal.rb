class Meal < ActiveRecord::Base
	has_many :orders, through: :order_details
	has_many :order_details
end
