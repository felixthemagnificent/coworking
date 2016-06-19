class Membership < ActiveRecord::Base
	has_many :visits, through: :visit_memberships
end
