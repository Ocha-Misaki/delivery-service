class CreateFoodSetItems < ActiveRecord::Migration[8.0]
  def change
    create_table :food_set_items do |t|
      t.references :food, null: false, foreign_key: true
      t.references :food_set, null: false, foreign_key: true
      t.integer :quantity, null: false

      t.timestamps
    end
    add_index :food_set_items, [ :food_id, :food_set_id ], unique: true, name: "index_food_set_items_on_food_and_food_set"
  end
end
