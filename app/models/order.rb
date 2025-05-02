class Order < ApplicationRecord
  belongs_to :user
  belongs_to :food_set

  has_one :delivery_schedules, dependent: :restrict_with_exception
  has_one :order_invoice, dependent: :restrict_with_exception

  validates :food_set_id, uniqueness: { scope: :user_id, message: 'すでに購入済みです。' }
  validates :total_price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :shipping_fee, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :refrigerated_fee, presence: true, numericality: { greater_than_or_equal_to: 0 }

  scope :default_order, -> { order(created_at: :desc) }
end
