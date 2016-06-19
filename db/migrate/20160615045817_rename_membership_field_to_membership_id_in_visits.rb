class RenameMembershipFieldToMembershipIdInVisits < ActiveRecord::Migration
  def change
  	rename_column :visits, :membership, :membership_id
  end
end
