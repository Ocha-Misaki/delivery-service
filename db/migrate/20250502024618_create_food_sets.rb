class CreateFoodSets < ActiveRecord::Migration[8.0]
  def change
    create_table :food_sets do |t|
      t.string :name, null: false, default: ""
      t.integer :price, null: false
      t.integer :total_weight, null: false
      t.boolean :refrigerated, null: false, default: false

      t.timestamps
    end
  end
end
