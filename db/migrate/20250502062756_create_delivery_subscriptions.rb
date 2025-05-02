class CreateDeliverySubscriptions < ActiveRecord::Migration[8.0]
  def change
    create_table :delivery_subscriptions do |t|
      t.references :user, null: false, foreign_key: true
      t.date :planned_delivery_on, null: false
      t.date :next_delivery_on, null: false

      t.timestamps
    end
  end
end
