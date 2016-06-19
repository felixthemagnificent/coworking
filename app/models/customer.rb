class Customer < ActiveRecord::Base
	has_many :visits
	has_many :orders, through: :visits
end
