class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.string :name
      t.integer :price
      t.boolean :is_available

      t.timestamps null: false
    end
  end
end
