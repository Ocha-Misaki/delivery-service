class AddUsersInfo < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :name, :string, null: false, default: ""
    add_column :users, :plan, :string, null: false, default: "light"
    add_column :users, :schedule, :string, null: false, default: "weekly"
    add_column :users, :address, :text, null: false, default: ""
    add_column :users, :usage_count, :integer, null: false, default: 0
    add_column :users, :phone_number, :string, null: false, default: ""
    add_column :users, :delivery_pause_requested, :boolean, null: false, default: false
  end
end
