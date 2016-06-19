class CreateVisitMemberships < ActiveRecord::Migration
  def change
    create_table :visit_memberships do |t|
      t.belongs_to :visit, index: true
      t.belongs_to :membership, index: true

      t.timestamps null: false
    end
  end
end
