class FoodSet < ApplicationRecord
  has_many :food_set_items, dependent: :restrict_with_exception
  has_many :foods, through: :food_set_items

  validates :name, presence: true
  validates :price, presence: true
  validates :total_weight, presence: true
  validates :refrigerated, inclusion: { in: [true, false] }

  scope :default_order, -> { order(created_at: :desc) }
  scope :refrigerated, -> { where(refrigerated: true) }
end
