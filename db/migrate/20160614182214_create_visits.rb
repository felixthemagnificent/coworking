class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.references :customer, index: true, foreign_key: true
      t.integer :membership
      t.datetime :check_in
      t.datetime :check_out

      t.timestamps null: false
    end
  end
end
