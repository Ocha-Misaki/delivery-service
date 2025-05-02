class Order < ApplicationRecord
  belongs_to :user
  has_one :order_item, dependent: :restrict_with_exception

  scope :default_order, -> { order(created_at: :desc) }
end
