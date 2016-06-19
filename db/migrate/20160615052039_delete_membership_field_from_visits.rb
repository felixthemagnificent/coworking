class DeleteMembershipFieldFromVisits < ActiveRecord::Migration
  def change
  	remove_column :visits, :membership_id, :integer
  end
end
