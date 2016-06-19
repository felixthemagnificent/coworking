class VisitMembership < ActiveRecord::Base
	belongs_to :visit
	belongs_to :membership
end
