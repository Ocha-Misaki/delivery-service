class FoodSet < ApplicationRecord
  has_many :food_set_items, dependent: :restrict_with_exception
  has_many :foods, through: :food_set_items

  validates :name, presence: true
  validates :price, presence: true
  validates :total_weight, presence: true

  scope :default_order, -> { order(created_at: :desc) }
  scope :refrigerated, -> { where(refrigerated: true) }
end
