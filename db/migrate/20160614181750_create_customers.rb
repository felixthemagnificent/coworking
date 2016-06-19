class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.integer :type
      t.string :name
      t.text :notes

      t.timestamps null: false
    end
  end
end
