class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders, dependent: :restrict_with_exception

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
    orders.exists?(food_set: food_set)
  end

  def create_order_by!(food_set)
    order = orders.build(
      food_set: food_set,
      shipping_fee: self.shipping_fee,
      refrigerated_fee: food_set.refrigerated? ? FoodSet::REFRIGERATED_FEE : 0,
    )
    order.total_price = food_set.price_including_tax + order.shipping_fee + order.refrigerated_fee
    order.save!
  end
end
