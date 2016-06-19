class Visit < ActiveRecord::Base
  belongs_to :customer
  has_one :order
  has_one :visit_membership
  has_one :membership, through: :visit_membership
end
