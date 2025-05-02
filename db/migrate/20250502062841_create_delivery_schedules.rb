class CreateDeliverySchedules < ActiveRecord::Migration[8.0]
  def change
    create_table :delivery_schedules do |t|
      t.string :time_period
      t.date :scheduled_on
      t.string :status, null: false
      t.references :order, null: false, foreign_key: true
      t.references :delivery_subscription, foreign_key: true

      t.timestamps
    end
  end
end
