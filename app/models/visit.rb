class Visit < ActiveRecord::Base
  belongs_to :customer
  has_one :order
  has_one :visit_membership
  has_one :membership, through: :visit_membership

  scope :closed_orders, -> { where.not(checkout: nil) }

  def order_closed
  	unless self.check_out.nil? then
  		return true
  	else
  		return false
  	end
  end
end
