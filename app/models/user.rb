class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders, dependent: :restrict_with_exception
  has_many :order_items, through: :orders

  validates :name, presence: true
  validates :plan, presence: true
  validates :schedule, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true

  extend Enumerize
  enumerize :plan, in: [ :light, :standard, :family ], predicates: { prefix: true }
  enumerize :schedule, in: [ :weekly, :monthly ], predicates: { prefix: true }

  def additional_shipping_fee_required?
    address.match?(/\A(北海道|沖縄県)/)
  end

  def shipping_fee
    if additional_shipping_fee_required?
      FoodSet::ADDITIONAL_SHIPPING_FEE
    else
      FoodSet::SHIPPING_FEE
    end
  end

  def food_set_orderable?(food_set)
    order_items.exists?(food_set_id: food_set.id)
  end

  def create_order_by!(food_set)
    transaction do
      order = orders.build
      order_item = order.build_order_item(
        food_set_name: food_set.name,
        food_set_total_weight: food_set.total_weight,
        food_set_shipping_fee: shipping_fee,
        food_set_refrigerated_fee: food_set.refrigerated_fee,
        food_set_price: food_set.price_including_tax,
        food_set: food_set
      )
      order_item.food_set_total_price = order_item.food_set_price + order_item.food_set_shipping_fee + order_item.food_set_refrigerated_fee
      order_item.save!
    end
  end
end
