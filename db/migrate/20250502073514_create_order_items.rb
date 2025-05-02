class CreateOrderItems < ActiveRecord::Migration[8.0]
  def change
    create_table :order_items do |t|
      t.references :food_set, foreign_key: true, null: false
      t.references :order, foreign_key: true, null: false
      t.string :food_set_name, null: false
      t.integer :food_set_price, null: false
      t.integer :food_set_total_weight, null: false
      t.integer :food_set_refrigerated_fee, null: false
      t.integer :food_set_shipping_fee, null: false
      t.integer :total_price, null: false
      t.timestamps
    end
    add_index :order_items, [ :food_set_id, :order_id ], unique: true
  end
end
