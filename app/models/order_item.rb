class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :food_set
  has_one :user, through: :order

  validates :food_set_name, presence: true
  validates :food_set_total_weight, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :food_set_shipping_fee, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :food_set_refrigerated_fee, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :food_set_price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :total_price, presence: true, numericality: { greater_than_or_equal_to: 0 }

  def food_set_orderable?
    food_set.orderable?
  end
end
