class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :food_set, null: false, foreign_key: true
      t.integer :total_price, null: false
      t.integer :shipping_fee, null: false
      t.integer :refrigerated_fee, null: false, default: 0

      t.timestamps
    end
    add_index :orders, [ :user_id, :food_set_id ], unique: true
  end
end
